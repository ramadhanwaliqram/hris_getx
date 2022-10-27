import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:hris_getx/app/data/models/calendar_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart' hide Response, MultipartFile, FormData;
import 'package:get_storage/get_storage.dart';
import 'package:hris_getx/app/data/config.dart';
import 'package:hris_getx/app/data/models/today_attendance_model.dart';
import 'package:intl/intl.dart';
import 'package:hris_getx/app/data/models/profile_model.dart';

import '../../../data/models/attendance_model.dart';

class HomeController extends GetxController with StateMixin {
  var dio = Dio();
  final String userToken = GetStorage().read('access_token');

  final dayNow = DateFormat('EEEE, d MMM, ' 'yyyy').format(DateTime.now());
  final timeIn =
      DateFormat('Hm').format(DateTime.now()).toString().replaceAll('.', ':');
  final timeNow = DateFormat('jm').format(DateTime.now());

  final Rx<DateTime> selectedDay = Rx<DateTime>(
    DateTime.now(),
  );
  final Rx<DateTime> focusedDay = Rx<DateTime>(
    DateTime.now(),
  );

  RxInt selectedIndex = 0.obs;

  final Rx<CalendarModel> calendars = CalendarModel().obs;

  RxString currentAddress = ''.obs;
  RxString latLongUser = ''.obs;
  LocationPermission? permission;

  RxString getCheckIn = ''.obs;
  RxString getCheckOut = ''.obs;
  Rx<DataCalendar> getDetailAtt = DataCalendar().obs;

  DateTime jamMasuk = DateTime.parse("2022-01-01 09:00:00");
  DateTime jamPulang = DateTime.parse("2022-01-01 19:00:00");
  DateTime jamSekarang = DateTime.now();

  RxBool isLoading = true.obs;

  final todayAttendance = TodayAttendanceModel().obs;
  final summaryAttendance = AttendanceModel().obs;

  RxString monthNow = '${DateFormat('M').format(DateTime.now())}'.obs;
  RxString yearNow = '${DateFormat('yyyy').format(DateTime.now())}'.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
    getTodayAttendance();
    getProfile();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  RxString statusAtt = ''.obs;

  void getCurrentLocation() async {
    permission = await Geolocator.requestPermission();
    Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((position) async {
      latLongUser.value = "${position.latitude},${position.longitude}";
      print(latLongUser.value);
    }).catchError((e) {
      print(e);
    });
  }

  final _profile = ProfileModel().obs;
  ProfileModel get profiles => _profile.value;

  void getProfile() async {
    dio.options.headers['Authorization'] = "Bearer $userToken";
    dio.options.headers['Accept'] = 'application/json';

    final response = await dio.get(getProfileUrl);

    if (response.statusCode == 200) {
      GetStorage().write('name', '${response.data['name']}');
      _profile.value = ProfileModel.fromJson(response.data);
      change(_profile, status: RxStatus.success());
    } else {
      Future.error('Failed to load profile');
      change(null, status: RxStatus.error());
    }
  }

  Future<CalendarModel> getCalendars() async {
    isLoading.value = true;
    dio.options.headers['Authorization'] = "Bearer $userToken";
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers["Content-Type"] = "multipart/form-data";

    Response response = await dio.get(getAllAttendanceUrl).then((value) {
      return value;
    }).catchError((error) {
      return error;
    });

    isLoading.value = false;
    return calendars.value = CalendarModel.fromJson(response.data);
  }

  Future<dynamic> getAttendance() async {
    dio.options.headers['Authorization'] = "Bearer $userToken";
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers["Content-Type"] = "multipart/form-data";

    FormData formData = await FormData.fromMap({
      'month': '${monthNow}',
      'year': '${yearNow}',
    });

    Response response =
        await dio.post(getAttendanceUrl, data: formData).then((value) {
      return value;
    }).catchError((error) {
      return error;
    });

    return summaryAttendance.value = AttendanceModel.fromJson(response.data);
  }

  Future<dynamic> getTodayAttendance() async {
    dio.options.headers['Authorization'] = "Bearer $userToken";
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers["Content-Type"] = "multipart/form-data";

    Response response = await dio.get(getTodayAttendanceUrl).then((value) {
      return value;
    }).catchError((error) {
      return error;
    });

    return todayAttendance.value = TodayAttendanceModel.fromJson(response.data);
  }

  Future<dynamic> assignAttendance() async {
    try {
      dio.options.headers['Authorization'] = "Bearer $userToken";
      dio.options.headers['Accept'] = 'application/json';
      // dio.options.headers["Content-Type"] = "multipart/form-data";

      FormData formData = await FormData.fromMap({
        'type': statusAtt.value,
        'coordinate': latLongUser.value,
      });

      var response = await dio.post(assignAttendanceUrl, data: formData);

      return response.data;
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return throw Exception('${e.response!.data['message']}');
      }
      if (e.response!.statusCode == 500) {
        return throw Exception('Terjadi Kesalahan Server');
      }
      return throw Exception('Failed to load data');
    }
  }
}

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile, Response;
import 'package:get_storage/get_storage.dart';
import 'package:hris_getx/app/data/models/history_leave_model.dart';
import 'package:path_provider/path_provider.dart';
import '../../../data/config.dart';
import '../../../data/models/leave_history_by_id_model.dart';

class PaidLeaveController extends GetxController with StateMixin {
  RxBool customTileExpanded = false.obs;
  var dio = Dio();
  final String userToken = GetStorage().read('access_token');

  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  final TextEditingController reason = TextEditingController();
  final TextEditingController assignBy = TextEditingController();

  Rx<MemoryImage> memoryImage = MemoryImage(Uint8List(0)).obs;

  MultipartFile? image;

  RxInt remLeave = 0.obs;

  final Rx<LeaveHistoryModel> listHistories = LeaveHistoryModel().obs;
  final Rx<LeaveHistoryByIdModel> listHistoriesById =
      LeaveHistoryByIdModel().obs;

  final remainingLeaves = 0.obs;
  get remainingLeave => remainingLeaves;

  final getIdLeaveHistory = Get.parameters;

  @override
  void onInit() {
    super.onInit();
    // getRemainingLeaves();
    // getLeaveHistory();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<LeaveHistoryModel> getLeaveHistory() async {
    dio.options.headers['Authorization'] = "Bearer $userToken";
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers["Content-Type"] = "multipart/form-data";

    Response response = await dio.get(getLeaveHistoryUrl).then(
      (value) {
        return value;
      },
    ).catchError(
      (error) {
        print(error.toString());
      },
    );

    if (response.statusCode == 200) {
      listHistories.value = LeaveHistoryModel.fromJson(response.data);
    }

    return listHistories.value = LeaveHistoryModel.fromJson(response.data);
  }

  Future<LeaveHistoryByIdModel> getLeaveHistoryById(int? id) async {
    dio.options.headers['Authorization'] = "Bearer $userToken";
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers["Content-Type"] = "multipart/form-data";

    Response response = await dio.get('${getLeaveHistoryUrl}/${id}').then(
      (value) {
        return value;
      },
    ).catchError(
      (error) {
        print(error.toString());
      },
    );

    if (response.statusCode == 200) {
      listHistoriesById.value = LeaveHistoryByIdModel.fromJson(response.data);
    }

    return listHistoriesById.value =
        LeaveHistoryByIdModel.fromJson(response.data);
  }

  Future<dynamic> assignLeaves() async {
    try {
      dio.options.headers['Authorization'] = "Bearer $userToken";
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["Content-Type"] = "multipart/form-data";

      final tempDir = await getTemporaryDirectory();
      File file = await File('${tempDir.path}/image.png').create();
      file.writeAsBytesSync(memoryImage.value.bytes);

      image =
          await MultipartFile.fromFile(file.path, filename: 'signature.png');

      FormData formData = await FormData.fromMap({
        'start': startDate.text,
        'end': endDate.text,
        'reasons': reason.text,
        'assign_by': assignBy.text,
        'chief_signature': image,
      });

      Response response = await dio.post('${assignLeaveUrl}', data: formData);

      return response.data;
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return throw Exception('${e.response!.data['message']}');
      }
      return throw Exception('Failed to load data');
    }
  }

  Future<void> getRemainingLeaves() async {
    dio.options.headers['Authorization'] = "Bearer $userToken";
    dio.options.headers['Accept'] = 'application/json';

    final response = await dio.get(getRemainingLeaveUrl);

    if (response.statusCode == 200) {
      return remLeave.value = response.data['remaining_leaves'];
      // remainingLeave.value = response.data['remaining_leaves'];
      // change(remainingLeaves, status: RxStatus.success());
    } else {
      return Future.error('Failed to load data');
      // change(null, status: RxStatus.error());
    }
  }

  Future selectStartDate() async {
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2030),
    );
    if (picked != null) {
      startDate.text = picked.toString().substring(0, 10);
    }
  }

  Future selectEndDate() async {
    DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2020),
      lastDate: new DateTime(2030),
    );
    if (picked != null) {
      endDate.text = picked.toString().substring(0, 10);
    }
  }
}

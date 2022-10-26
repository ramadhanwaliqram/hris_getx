import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response, MultipartFile, FormData;
import 'package:get_storage/get_storage.dart';
import '../../../data/config.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/models/profile_model.dart';

class SettingsController extends GetxController with StateMixin {
  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  final TextEditingController phoneNumberC = TextEditingController();
  final TextEditingController addressC = TextEditingController();

  RxBool handleChangePhoneNumber = true.obs;
  RxBool handleChangeAddress = true.obs;

  RxString selectedImagePath = ''.obs;
  RxString selectedImageSize = ''.obs;
  RxString pathFile = ''.obs;
  RxString nameFile = ''.obs;
  RxInt sizeFile = 0.obs;

  var dio = Dio();
  final String userToken = GetStorage().read('access_token');

  final _profile = ProfileModel().obs;
  ProfileModel get profiles => _profile.value;

  Future<void> getImage(ImageSource imageSource) async {
    final pickedFile =
        await ImagePicker().pickImage(source: imageSource, imageQuality: 50);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      nameFile.value = pickedFile.name;
      selectedImageSize.value =
          (File(selectedImagePath.value).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              "Mb";
    } else {
      Get.snackbar('Warning', 'No Image Selected');
    }
  }

  Future<dynamic> updateProfile() async {
    final idUser = GetStorage().read('id_user');
    try {
      dio.options.headers['Authorization'] = "Bearer $userToken";
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["Content-Type"] = "multipart/form-data";

      FormData formData = await FormData.fromMap({
        'phone_number': phoneNumberC.text,
        'address': addressC.text,
      });

      if (selectedImagePath.value != '') {
        final fileMultipart = await MultipartFile.fromFile(
            selectedImagePath.value,
            filename: nameFile.value.split('/').last);
        formData.files.add(
          MapEntry(
            'profile_picture',
            fileMultipart,
          ),
        );
      }

      formData.fields.removeWhere((e) => e.value == "");

      Response response = await dio.post('${updateProfileUrl}/${idUser}/update',
          data: formData);

      getProfile();

      return response.data;
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return throw Exception('${e.response!.data['message']}');
      }
      return throw Exception('${e}');
    }
  }

  void getProfile() async {
    dio.options.headers['Authorization'] = "Bearer $userToken";
    dio.options.headers['Accept'] = 'application/json';

    final response = await dio.get(getProfileUrl);

    if (response.statusCode == 200) {
      GetStorage().write('name', '${response.data['name']}');
      GetStorage().write('id_user', '${response.data['id']}');
      phoneNumberC.text = response.data['phone_number'];
      addressC.text = response.data['address'];
      _profile.value = ProfileModel.fromJson(response.data);
      change(_profile, status: RxStatus.success());
    } else {
      Future.error('Failed to load profile');
      change(null, status: RxStatus.error());
    }
  }
}

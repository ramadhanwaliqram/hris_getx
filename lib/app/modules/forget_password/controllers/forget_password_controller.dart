import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Response, MultipartFile, FormData;
import 'package:get_storage/get_storage.dart';
import '../../../data/config.dart';

class ForgetPasswordController extends GetxController {
  @override
  void onInit() {
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

  TextEditingController emailC = TextEditingController();
  TextEditingController digitOneC = TextEditingController();
  TextEditingController digitTwoC = TextEditingController();
  TextEditingController digitThreeC = TextEditingController();
  TextEditingController digitFourC = TextEditingController();
  TextEditingController digitFiveC = TextEditingController();
  TextEditingController digitSixC = TextEditingController();
  TextEditingController newPassC = TextEditingController();
  TextEditingController confirmNewPassC = TextEditingController();

  RxString emailUser = ''.obs;
  RxString emailUserTruncated = ''.obs;

  var dio = Dio();
  final idUser = GetStorage().read('id_user');

  void clearTextField() {
    emailC.clear();
    newPassC.clear();
    confirmNewPassC.clear();
    digitOneC.clear();
    digitTwoC.clear();
    digitThreeC.clear();
    digitFourC.clear();
    digitFiveC.clear();
    digitSixC.clear();
  }

  void truncateEmail(String email) {
    final splitEmail = email.split('@');
    emailUserTruncated.value =
        splitEmail[0].substring(0, 3) + '....' + '@' + splitEmail[1];
  }

  Future<dynamic> resetPassword({
    String? token,
    String? new_password,
    String? new_password_confirmation,
  }) async {
    try {
      // dio.options.headers['Authorization'] = "Bearer $token";
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["Content-Type"] = "multipart/form-data";

      FormData formData = await FormData.fromMap({
        'token': token,
        'new_password': newPassC.text,
        'new_password_confirmation': confirmNewPassC.text,
      });

      Response response = await dio.post(resetPasswordUrl, data: formData);

      return response.data;
    } on DioError catch (e) {
      print(e.response!.data['errors']);
      if (e.response!.statusCode == 400) {
        return throw Exception('${e.response!.data['message']}');
      }
      if (e.response!.statusCode == 500) {
        return throw Exception('Terjadi Kesalahan Server');
      }
      return throw Exception('${e}');
    }
  }

  Future<dynamic> otpVerification(String? email) async {
    try {
      // dio.options.headers['Authorization'] = "Bearer $userToken";
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["Content-Type"] = "multipart/form-data";

      FormData formData = await FormData.fromMap({
        'email': emailC.text,
        'code':
            "${digitOneC.text}${digitTwoC.text}${digitThreeC.text}${digitFourC.text}${digitFiveC.text}${digitSixC.text}",
      });

      Response response = await dio.post(verifOTPUrl, data: formData);

      return response.data['token'];
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return throw Exception('${e.response!.data['message']}');
      }
      if (e.response!.statusCode == 500) {
        return throw Exception('Terjadi Kesalahan Server');
      }
      return throw Exception('${e}');
    }
  }

  Future<dynamic> sendOTP() async {
    try {
      // dio.options.headers['Authorization'] = "Bearer $userToken";
      dio.options.headers['Accept'] = 'application/json';
      dio.options.headers["Content-Type"] = "multipart/form-data";

      FormData formData = await FormData.fromMap({
        'email': emailC.text,
      });

      Response response = await dio.post(sendOTPUrl, data: formData);

      return response.data;
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return throw Exception('${e.response!.data['message']}');
      }
      if (e.response!.statusCode == 500) {
        return throw Exception('Terjadi Kesalahan Server');
      }
      return throw Exception('${e}');
    }
  }
}

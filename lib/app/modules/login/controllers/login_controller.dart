import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide FormData, MultipartFile, Response;
import 'package:get_storage/get_storage.dart';
import 'package:hris_getx/app/data/config.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  var dio = Dio();
  var box = GetStorage();

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

  Future<dynamic> login({
    String? username,
    String? password,
  }) async {
    try {
      Response response = await dio.post('${loginUrl}', data: {
        'scope': '*',
        'client_id': clientId,
        'client_secret': clientSecret,
        'grant_type': 'password',
        'username': username,
        'password': password,
      });

      box.write('access_token', '${response.data['access_token']}');

      return response.data;
    } on DioError catch (e) {
      if (e.response!.statusCode == 400) {
        return throw Exception('Username atau password salah!');
      }
      if (e.response!.statusCode == 500) {
        return throw Exception('Terjadi Kesalahan Server');
      }
      if (e.response!.statusCode == 429) {
        return throw Exception('Too many attemps');
      }
    }
  }

  Future logout() async {
    await box.erase();
    Get.offAllNamed(Routes.LOGIN);
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  String? userToken = GetStorage().read('access_token');

  initializeDateFormatting('id_ID');
  Intl.defaultLocale = 'id_ID';

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: userToken != null ? Routes.HOME : Routes.LOGIN,
      getPages: AppPages.routes,
    ),
  );
}

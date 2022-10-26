import 'package:get/get.dart';

import '../modules/forget_password/bindings/forget_password_binding.dart';
import '../modules/forget_password/views/forget_password_view.dart';
import '../modules/forget_password/views/otp_view.dart';
import '../modules/forget_password/views/reset_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/paid_leave/bindings/paid_leave_binding.dart';
import '../modules/paid_leave/views/aply_leave_view.dart';
import '../modules/paid_leave/views/detail_leave_history_view.dart';
import '../modules/paid_leave/views/paid_leave_view.dart';
import '../modules/salary/bindings/salary_binding.dart';
import '../modules/salary/views/salary_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASSWORD,
      page: () => ForgetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => ResetPasswordView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: ForgetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PAID_LEAVE,
      page: () => PaidLeaveView(),
      binding: PaidLeaveBinding(),
    ),
    GetPage(
      name: _Paths.APLY_LEAVE,
      page: () => AplyLeaveView(),
      binding: PaidLeaveBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_LEAVE_HISTORY,
      page: () => DetailLeaveHistoryView(),
      binding: PaidLeaveBinding(),
    ),
    GetPage(
      name: _Paths.SALARY,
      page: () => const SalaryView(),
      binding: SalaryBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}

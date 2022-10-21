import 'package:get/get.dart';

import '../controllers/paid_leave_controller.dart';

class PaidLeaveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaidLeaveController>(
      () => PaidLeaveController(),
    );
  }
}

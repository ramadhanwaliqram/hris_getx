import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/custom_bottom_nav.dart';
import '../controllers/salary_controller.dart';

class SalaryView extends GetView<SalaryController> {
  const SalaryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomBottomNavBar(),
      appBar: AppBar(
        title: const Text('SalaryView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SalaryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

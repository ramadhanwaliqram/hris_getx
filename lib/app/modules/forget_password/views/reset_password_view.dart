import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hris_getx/app/modules/forget_password/controllers/forget_password_controller.dart';
import '../../../data/theme.dart';
import '../../../routes/app_pages.dart';

class ResetPasswordView extends GetView {
  ResetPasswordView({this.token, Key? key}) : super(key: key);
  final String? token;
  final RxBool _obscureText = true.obs;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: WillPopScope(
        onWillPop: () async {
          controller.clearTextField();
          Get.offAndToNamed(Routes.FORGET_PASSWORD);
          return false;
        },
        child: Scaffold(
          // appBar: AppBar(
          //   title: const Text('ResetPasswordView'),
          //   centerTitle: true,
          // ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 56,
                    height: 16,
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 54,
                      height: 16,
                    ),
                  ),
                  SizedBox(height: 56),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reset Password",
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff303030),
                          ),
                        ),
                        SizedBox(height: 24),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Obx(
                            () => TextFormField(
                              style: TextStyle(decoration: TextDecoration.none),
                              obscureText: _obscureText.value,
                              controller: controller.newPassC,
                              autocorrect: false,
                              decoration: InputDecoration(
                                labelText: "Password",
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                labelStyle: TextStyle(
                                  color: Color(0xffC4C4C4),
                                ),
                                suffixIcon: IconButton(
                                  splashColor: Colors.transparent,
                                  icon: _obscureText.value
                                      ? Image.asset(
                                          'assets/icons/eye.png',
                                          width: 16,
                                        )
                                      : Image.asset(
                                          'assets/icons/eye.png',
                                          width: 16,
                                          color: Color(0xff303030),
                                        ),
                                  onPressed: () {
                                    _obscureText.value = !_obscureText.value;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Obx(
                            () => TextFormField(
                              style: TextStyle(decoration: TextDecoration.none),
                              obscureText: _obscureText.value,
                              controller: controller.confirmNewPassC,
                              autocorrect: false,
                              decoration: InputDecoration(
                                labelText: "Konfirmasi Password",
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                labelStyle: TextStyle(
                                  color: Color(0xffC4C4C4),
                                ),
                                suffixIcon: IconButton(
                                  splashColor: Colors.transparent,
                                  icon: _obscureText.value
                                      ? Image.asset(
                                          'assets/icons/eye.png',
                                          width: 16,
                                        )
                                      : Image.asset(
                                          'assets/icons/eye.png',
                                          width: 16,
                                          color: Color(0xff303030),
                                        ),
                                  onPressed: () {
                                    _obscureText.value = !_obscureText.value;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff009EFF).withOpacity(0.5),
                                  offset: Offset(0, 2),
                                  blurRadius: 16,
                                ),
                              ],
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0.0, 1.0],
                                colors: [
                                  Color(0xff009EFF),
                                  Color(0xff29D1F5),
                                ],
                              ),
                              color: Color(0xff009EFF),
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)),
                                minimumSize: Size(double.infinity, 50),
                                backgroundColor: Colors.transparent,
                                // elevation: MaterialStateProperty.all(3),
                                shadowColor: Colors.transparent,
                              ),
                              onPressed: controller.newPassC.text.isEmpty ||
                                      controller.confirmNewPassC.text.isEmpty
                                  ? null
                                  : () async {
                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) => WillPopScope(
                                          onWillPop: () async => false,
                                          child: AlertDialog(
                                            scrollable: true,
                                            content: Row(
                                              children: [
                                                CircularProgressIndicator(),
                                                SizedBox(width: 14),
                                                Text('Loading...'),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                      await controller
                                          .resetPassword(
                                        token: token,
                                        new_password: controller.newPassC.text,
                                        new_password_confirmation:
                                            controller.confirmNewPassC.text,
                                      )
                                          .then((value) {
                                        controller.clearTextField();
                                        Get.back(closeOverlays: true);
                                        Get.offNamedUntil(
                                            Routes.LOGIN, (route) => false);
                                        showSnackbarCustom(
                                            'Reset password sukses');
                                      }).catchError((error) {
                                        Get.back(closeOverlays: true);
                                        controller.clearTextField();
                                        showSnackbarCustom(
                                            error.message.toString());
                                      });
                                    },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Text(
                                  'Reset Password',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

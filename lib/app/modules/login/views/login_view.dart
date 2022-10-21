import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hris_getx/app/data/theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final RxBool _obscureText = true.obs;

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
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
                        "Selamat Datang",
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff303030),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Silahkan Login terlebih dahulu untuk lanjut menggunakan aplikasi",
                        style: GoogleFonts.nunito(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff666666),
                        ),
                      ),
                      SizedBox(height: 24),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Color(0xffF2F2F2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TextField(
                          controller: controller.username,
                          style: TextStyle(decoration: TextDecoration.none),
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedErrorBorder: InputBorder.none,
                            labelStyle: TextStyle(
                              color: Color(0xffC4C4C4),
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
                          () => TextField(
                            controller: controller.password,
                            style: TextStyle(decoration: TextDecoration.none),
                            obscureText: _obscureText.value,
                            autocorrect: false,
                            textInputAction: TextInputAction.send,
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
                            onPressed: () async {
                              if (controller.username.text.isEmpty ||
                                  controller.password.text.isEmpty) {
                                Get.rawSnackbar(
                                  message:
                                      'Username atau password tidak boleh kosong.',
                                  snackPosition: SnackPosition.TOP,
                                  borderRadius: 50,
                                  margin: EdgeInsets.all(16),
                                );
                              } else {
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
                                Future.delayed(Duration(seconds: 2), () async {
                                  await controller
                                      .login(
                                    username: controller.username.text,
                                    password: controller.password.text,
                                  )
                                      .then((value) {
                                    Get.back(closeOverlays: true);
                                    Get.offAndToNamed(Routes.HOME);
                                  }).catchError((error) {
                                    Get.back(closeOverlays: true);
                                    showSnackbarCustom(
                                        error.message.toString());
                                  });
                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                              ),
                              child: Text(
                                'Login',
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
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Get.offAndToNamed(Routes.FORGET_PASSWORD);
                          },
                          child: Text(
                            "Lupa password?",
                            style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff009EFF),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

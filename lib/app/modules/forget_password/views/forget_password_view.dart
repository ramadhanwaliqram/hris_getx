import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/forget_password_controller.dart';
import 'otp_view.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: WillPopScope(
        onWillPop: () async {
          Get.offAllNamed(Routes.LOGIN);
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black,
            leading: InkWell(
              borderRadius: BorderRadius.circular(50),
              child: Icon(Icons.arrow_back_ios_new_rounded, size: 16),
              onTap: () {
                Get.offAndToNamed(Routes.LOGIN);
              },
            ),
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lupa Password",
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff303030),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Silahkan masukkan email anda untuk mendapatkan link reset password",
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
                        child: TextFormField(
                          style: TextStyle(decoration: TextDecoration.none),
                          autocorrect: false,
                          controller: controller.emailC,
                          keyboardType: TextInputType.emailAddress,
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
                            onPressed: controller.emailC.text.isEmpty
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
                                    await controller.sendOTP().then((value) {
                                      Get.back(closeOverlays: true);
                                      Get.to(
                                        () => OtpView(
                                            email: controller.emailC.text),
                                      );
                                    }).catchError((error) {
                                      Get.back(closeOverlays: true);
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
                                'Minta Kode',
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

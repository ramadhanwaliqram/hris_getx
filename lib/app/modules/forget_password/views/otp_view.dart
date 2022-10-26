import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hris_getx/app/modules/forget_password/controllers/forget_password_controller.dart';
import 'package:hris_getx/app/modules/forget_password/views/reset_password_view.dart';
import '../../../data/theme.dart';
import '../../../routes/app_pages.dart';

class OtpView extends GetView<ForgetPasswordController> {
  OtpView({this.email, Key? key}) : super(key: key);
  final String? email;
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    final double padding = 16;
    final double spaceBetween = 8;
    final double responsiveWidth =
        (deviceWidth / 6) - padding - (spaceBetween / 6);

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
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black,
            leading: InkWell(
              borderRadius: BorderRadius.circular(50),
              child: Icon(Icons.arrow_back_ios_new_rounded, size: 16),
              onTap: () {
                Get.offAndToNamed(Routes.FORGET_PASSWORD);
              },
            ),
          ),
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
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Verifikasi",
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff303030),
                          ),
                        ),
                        SizedBox(height: 4),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            text: 'Kode verifikasi telah dikirimkan ke ',
                            style: GoogleFonts.nunito(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff666666),
                            ),
                            children: [
                              TextSpan(
                                text:
                                    '${email!.split('@')[0].substring(0, 3) + '....' + '@' + email!.split('@')[1]}',
                                style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff666666),
                                ),
                              ),
                              TextSpan(
                                text:
                                    '. Cek inbox email anda, jika tidak ada cek di folder spam.',
                                style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff666666),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xfff2f2f2),
                              ),
                              width: responsiveWidth,
                              height: 48,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                },
                                controller: controller.digitOneC,
                                maxLength: 1,
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                                cursorColor: Theme.of(context).primaryColor,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: '',
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xfff2f2f2),
                              ),
                              width: responsiveWidth,
                              height: 48,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  if (value.length == 0) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                controller: controller.digitTwoC,
                                maxLength: 1,
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                                cursorColor: Theme.of(context).primaryColor,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: '',
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xfff2f2f2),
                              ),
                              width: responsiveWidth,
                              height: 48,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  if (value.length == 0) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                controller: controller.digitThreeC,
                                maxLength: 1,
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                                cursorColor: Theme.of(context).primaryColor,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: '',
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xfff2f2f2),
                              ),
                              width: responsiveWidth,
                              height: 48,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  if (value.length == 0) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                controller: controller.digitFourC,
                                maxLength: 1,
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                                cursorColor: Theme.of(context).primaryColor,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: '',
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xfff2f2f2),
                              ),
                              width: responsiveWidth,
                              height: 48,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).nextFocus();
                                  }
                                  if (value.length == 0) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                controller: controller.digitFiveC,
                                maxLength: 1,
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                                cursorColor: Theme.of(context).primaryColor,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: '',
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xfff2f2f2),
                              ),
                              width: responsiveWidth,
                              height: 48,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                onChanged: (value) {
                                  if (value.length == 1) {
                                    FocusScope.of(context).unfocus();
                                  }
                                  if (value.length == 0) {
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                controller: controller.digitSixC,
                                maxLength: 1,
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                                cursorColor: Theme.of(context).primaryColor,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  counterText: '',
                                ),
                              ),
                            ),
                          ],
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
                              onPressed: controller.digitOneC.text.length < 1 ||
                                      controller.digitTwoC.text.length < 1 ||
                                      controller.digitThreeC.text.length < 1 ||
                                      controller.digitFourC.text.length < 1 ||
                                      controller.digitFiveC.text.length < 1 ||
                                      controller.digitSixC.text.length < 1
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
                                          .otpVerification(email)
                                          .then((value) {
                                        controller.clearTextField();
                                        Get.back(closeOverlays: true);
                                        Get.to(() =>
                                            ResetPasswordView(token: value));
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
                                  'Verifikasi Kode',
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
      ),
    );
  }
}

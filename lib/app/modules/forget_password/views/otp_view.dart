import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';

class OtpView extends GetView {
  OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    final double padding = 16;
    final double spaceBetween = 8;
    final double responsiveWidth =
        (deviceWidth / 6) - padding - (spaceBetween / 6);

    return Scaffold(
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
                    Text(
                      "Kode verifikasi telah dikirimkan e......e@email.com. Cek inbox email anda, jika tidak ada cek di folder spam.",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.nunito(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff666666),
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _otpOne(responsiveWidth: responsiveWidth),
                        _otpTwo(responsiveWidth: responsiveWidth),
                        _otpThree(responsiveWidth: responsiveWidth),
                        _otpFour(responsiveWidth: responsiveWidth),
                        _otpFive(responsiveWidth: responsiveWidth),
                        _otpSix(responsiveWidth: responsiveWidth),
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
                          onPressed: () {
                            Get.offAndToNamed(Routes.RESET_PASSWORD);
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
    );
  }
}

class _otpThree extends StatelessWidget {
  const _otpThree({
    Key? key,
    required this.responsiveWidth,
  }) : super(key: key);

  final double responsiveWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xfff2f2f2),
      ),
      width: responsiveWidth,
      height: 48,
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        //  controller: this.code,
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
    );
  }
}

class _otpSix extends StatelessWidget {
  const _otpSix({
    Key? key,
    required this.responsiveWidth,
  }) : super(key: key);

  final double responsiveWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xfff2f2f2),
      ),
      width: responsiveWidth,
      height: 48,
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        //  controller: this.code,
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
    );
  }
}

class _otpFive extends StatelessWidget {
  const _otpFive({
    Key? key,
    required this.responsiveWidth,
  }) : super(key: key);

  final double responsiveWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xfff2f2f2),
      ),
      width: responsiveWidth,
      height: 48,
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        //  controller: this.code,
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
    );
  }
}

class _otpFour extends StatelessWidget {
  const _otpFour({
    Key? key,
    required this.responsiveWidth,
  }) : super(key: key);

  final double responsiveWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xfff2f2f2),
      ),
      width: responsiveWidth,
      height: 48,
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        //  controller: this.code,
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
    );
  }
}

class _otpTwo extends StatelessWidget {
  const _otpTwo({
    Key? key,
    required this.responsiveWidth,
  }) : super(key: key);

  final double responsiveWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xfff2f2f2),
      ),
      width: responsiveWidth,
      height: 48,
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        //  controller: this.code,
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
    );
  }
}

class _otpOne extends StatelessWidget {
  const _otpOne({
    Key? key,
    required this.responsiveWidth,
  }) : super(key: key);

  final double responsiveWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color(0xfff2f2f2),
      ),
      width: responsiveWidth,
      height: 48,
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        //  controller: this.code,
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
    );
  }
}

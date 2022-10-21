import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hris_getx/app/modules/paid_leave/controllers/paid_leave_controller.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import '../../../data/theme.dart';
import '../../../routes/app_pages.dart';

class AplyLeaveView extends GetView {
  AplyLeaveView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final paidLeaveController = Get.put(PaidLeaveController());
    final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
    void _handleClearButtonPressed() {
      signatureGlobalKey.currentState!.clear();
    }

    // void _handleSaveButtonPressed() async {
    //   final data =
    //       await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    //   final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    //   await Navigator.of(context).push(
    //     MaterialPageRoute(
    //       builder: (BuildContext context) {
    //         return Scaffold(
    //           appBar: AppBar(),
    //           body: Center(
    //             child: Container(
    //               color: Colors.grey[300],
    //               child: Image.memory(bytes!.buffer.asUint8List()),
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   );
    // }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
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
              Get.offAndToNamed(Routes.PAID_LEAVE);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          maintainBottomViewPadding: true,
          bottom: false,
          child: ListView(
            physics: ScrollPhysics(),
            padding: EdgeInsets.all(24),
            shrinkWrap: true,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pengajuan Cuti",
                      style: GoogleFonts.montserrat(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff303030),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Anda bisa mengubah data diri kamu di sini",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.nunitoSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff303030),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextField(
                            readOnly: true,
                            controller: paidLeaveController.startDate,
                            style: TextStyle(decoration: TextDecoration.none),
                            autocorrect: false,
                            textInputAction: TextInputAction.next,
                            onTap: () {
                              paidLeaveController.selectStartDate();
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                            },
                            decoration: InputDecoration(
                              labelText: "Mulai Cuti",
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xffC4C4C4),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  paidLeaveController.selectStartDate();
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                },
                                icon: Image.asset(
                                  'assets/icons/calendar.png',
                                  width: 18,
                                  color: Color(0xffB3B3B3),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: TextField(
                            readOnly: true,
                            controller: paidLeaveController.endDate,
                            style: TextStyle(decoration: TextDecoration.none),
                            autocorrect: false,
                            textInputAction: TextInputAction.next,
                            onTap: () {
                              paidLeaveController.selectEndDate();
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                            },
                            decoration: InputDecoration(
                              labelText: "Selesai Cuti",
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              labelStyle: TextStyle(
                                fontSize: 12,
                                color: Color(0xffC4C4C4),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  paidLeaveController.selectEndDate();
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                },
                                icon: Image.asset(
                                  'assets/icons/calendar.png',
                                  width: 18,
                                  color: Color(0xffB3B3B3),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    // height: 98,
                    decoration: BoxDecoration(
                      color: Color(0xffF2F2F2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      controller: paidLeaveController.reason,
                      style: TextStyle(decoration: TextDecoration.none),
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: "Keterangan",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        labelStyle: TextStyle(
                          fontSize: 12,
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
                    child: TextField(
                      controller: paidLeaveController.assignBy,
                      style: TextStyle(decoration: TextDecoration.none),
                      autocorrect: false,
                      // textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: "Disetujui Oleh",
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        labelStyle: TextStyle(
                          fontSize: 12,
                          color: Color(0xffC4C4C4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Stack(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 160,
                    child: SfSignaturePad(
                      key: signatureGlobalKey,
                      backgroundColor: Colors.white,
                      strokeColor: Colors.black,
                      minimumStrokeWidth: 1.0,
                      maximumStrokeWidth: 4.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xfff2f2f2),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Icon(
                        Icons.close,
                        size: 14,
                      ),
                      onPressed: _handleClearButtonPressed,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
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
                    final data = await signatureGlobalKey.currentState!
                        .toImage(pixelRatio: 3.0);
                    final bytes =
                        await data.toByteData(format: ui.ImageByteFormat.png);
                    paidLeaveController.memoryImage.value =
                        MemoryImage(bytes!.buffer.asUint8List());

                    if (paidLeaveController.startDate.text.isEmpty ||
                        paidLeaveController.endDate.text.isEmpty ||
                        paidLeaveController.reason.text.isEmpty ||
                        paidLeaveController.assignBy.text.isEmpty) {
                      showSnackbarCustom('Semua field harus diisi');
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
                        await paidLeaveController.assignLeaves().then((value) {
                          Get.back(closeOverlays: true);
                          showSnackbarCustom('Berhasil ajukan cuti');
                          Get.offAndToNamed(Routes.HOME);
                        }).catchError((error) {
                          Get.back(closeOverlays: true);
                          showSnackbarCustom(error.message.toString());
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
                      'Ajukan Cuti',
                      style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

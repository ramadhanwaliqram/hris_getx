import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hris_getx/app/modules/salary/controllers/salary_controller.dart';
import 'package:skeletons/skeletons.dart';
import '../../../data/currency_format.dart';
import '../../../routes/app_pages.dart';

class DetailSalaryView extends GetView {
  const DetailSalaryView({this.id, Key? key}) : super(key: key);
  final int? id;
  @override
  Widget build(BuildContext context) {
    final detailController = Get.put(SalaryController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        leading: InkWell(
          borderRadius: BorderRadius.circular(50),
          child: Icon(Icons.arrow_back_ios_new_rounded, size: 16),
          onTap: () {
            Get.offAndToNamed(Routes.SALARY);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 32,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Detail Cuti",
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff303030),
                  ),
                ),
                SizedBox(height: 32),
                FutureBuilder(
                  future: detailController.getSalaryById(id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Gaji Pokok',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "+ ${CurrencyFormat.convertToIdr(detailController.listSalaryById.value.salary ?? 0, 2)}",
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff00E23F),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Bonus',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                CurrencyFormat.convertToIdr(
                                    detailController
                                            .listSalaryById.value.reward ??
                                        0,
                                    2),
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Penambahan Lainnya',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "+ ${CurrencyFormat.convertToIdr(detailController.listSalaryById.value.additionalSalary ?? 0, 2)}",
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff00E23F),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Denda Keterlambatan',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                CurrencyFormat.convertToIdr(
                                    detailController
                                            .listSalaryById.value.lateCharge ??
                                        0,
                                    2),
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Denda Alfa',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                CurrencyFormat.convertToIdr(
                                    detailController.listSalaryById.value
                                            .attendanceFine ??
                                        0,
                                    2),
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Denda Tidak Check-In',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "-${CurrencyFormat.convertToIdr(detailController.listSalaryById.value.checkoutFine ?? 0, 2)}",
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xffFF5B5B),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Denda Tidak Check-Out',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                CurrencyFormat.convertToIdr(
                                    detailController.listSalaryById.value
                                            .checkoutFine ??
                                        0,
                                    2),
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pengurangan Lainnya',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                CurrencyFormat.convertToIdr(
                                    detailController.listSalaryById.value
                                            .otherSalaryDeductions ??
                                        0,
                                    2),
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ket. Penambahan',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "${detailController.listSalaryById.value.additionalInformation ?? '-'}",
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ket. Pengurangan',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "${detailController.listSalaryById.value.reductionInformation ?? '-'}",
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Keseluruhan',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                CurrencyFormat.convertToIdr(
                                    detailController
                                            .listSalaryById.value.total ??
                                        0,
                                    2),
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff00E23F),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 67),
                          Center(
                            child: TextButton(
                              onPressed: () async {
                                await detailController
                                    .launchPDFToBrowser(id!.toInt());
                              },
                              child: Text(
                                'Ekspor ke PDF',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff009EFF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 7,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SkeletonLine(
                                  style: SkeletonLineStyle(
                                    height: 12,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                SkeletonLine(
                                  style: SkeletonLineStyle(
                                    height: 12,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

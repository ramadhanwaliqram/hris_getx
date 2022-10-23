import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hris_getx/app/modules/paid_leave/controllers/paid_leave_controller.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:skeletons/skeletons.dart';
import '../../../routes/app_pages.dart';

class DetailLeaveHistoryView extends GetView {
  const DetailLeaveHistoryView({this.id, Key? key}) : super(key: key);
  final int? id;
  @override
  Widget build(BuildContext context) {
    final detailController = PaidLeaveController();
    return Scaffold(
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
                  future: detailController.getLeaveHistoryById(id),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var leaveStatus =
                          detailController.listHistoriesById.value.status;
                      Color? leaveColor;

                      if (leaveStatus == 'pending') {
                        leaveStatus = 'Diajukan';
                        leaveColor = Color(0xffFFB000);
                      }
                      if (leaveStatus == 'approved') {
                        leaveStatus = 'Disetujui';
                        leaveColor = Color(0xff00E23F);
                      }
                      if (leaveStatus == 'reject') {
                        leaveStatus = 'Ditolak';
                        leaveColor = Color(0xffFF5B5B);
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Pengajuan Cuti',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '${detailController.listHistoriesById.value.start ?? '-'}',
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
                                'Mulai Cuti',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '${detailController.listHistoriesById.value.start ?? '-'}',
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
                                'Selesai Cuti',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '${detailController.listHistoriesById.value.end ?? '-'}',
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
                                'Total Hari',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '${detailController.listHistoriesById.value.totalDays ?? '-'}',
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
                                'Alasan',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '${detailController.listHistoriesById.value.reasons ?? '-'}',
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
                                'Status',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '${detailController.listHistoriesById.value.status ?? '-'}',
                                style: GoogleFonts.nunitoSans(
                                  color: leaveColor,
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
                                'Alasan Penolakan',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff666666),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '${detailController.listHistoriesById.value.reasonRejected ?? '-'}',
                                style: GoogleFonts.nunitoSans(
                                  color: leaveColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 32),
                          Center(
                            child: Text(
                              'Diketahui Oleh',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunitoSans(
                                color: Color(0xff666666),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: 200,
                              height: 200,
                              child: FadeInImage(
                                placeholder:
                                    AssetImage('assets/images/no-image.jpg'),
                                image: NetworkImage(
                                    '${detailController.listHistoriesById.value.chiefSignature}'),
                                fit: BoxFit.cover,
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset(
                                      'assets/images/no-image.jpg');
                                },
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              '${GetStorage().read('name') ?? '-'}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunitoSans(
                                color: Color(0xff666666),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
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

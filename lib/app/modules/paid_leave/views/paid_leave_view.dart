import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hris_getx/app/data/models/history_leave_model.dart';
import 'package:hris_getx/app/modules/paid_leave/views/detail_leave_history_view.dart';
import 'package:hris_getx/app/routes/app_pages.dart';
import 'package:skeletons/skeletons.dart';
import '../../../data/custom_bottom_nav.dart';
import '../controllers/paid_leave_controller.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class PaidLeaveView extends GetView<PaidLeaveController> {
  PaidLeaveView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PaidLeaveController());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 16, bottom: 16),
        child: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.APLY_LEAVE);
          },
          backgroundColor: Color(0xff009EFF),
          child: Image.asset(
            'assets/icons/pencil.png',
            width: 20,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 56,
              height: 16,
            ),
            FutureBuilder(
              future: controller.getRemainingLeaves(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Obx(
                    () => Text(
                      'Sisa Cuti: ${controller.remLeave} Hari',
                      style: GoogleFonts.nunitoSans(
                        color: Color(0xff4C6493),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return Text('${snapshot.error}');
                }
                return SkeletonLine(
                  style: SkeletonLineStyle(
                    height: 12,
                    width: MediaQuery.of(context).size.width / 3,
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              },
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 32,
        ),
        children: [
          FutureBuilder<LeaveHistoryModel>(
            future: controller.getLeaveHistory(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                controller.listHistories.value = snapshot.data!;
                return Obx(
                  () => ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.listHistories.value.data?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Theme(
                          data: Theme.of(context)
                              .copyWith(dividerColor: Colors.transparent),
                          child: Obx(
                            () => ExpansionTile(
                              title: Row(
                                children: [
                                  Text(
                                    '${controller.listHistories.value.data?[index].year}',
                                    style: GoogleFonts.montserrat(
                                      color: Color(0xff303030),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Obx(
                                    () => Icon(controller
                                            .customTileExpanded.value
                                        ? Icons.keyboard_arrow_up_rounded
                                        : Icons.keyboard_arrow_down_rounded),
                                  ),
                                ],
                              ),
                              tilePadding: EdgeInsets.all(0),
                              trailing: SizedBox(),
                              children: <Widget>[
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.listHistories.value
                                      .data?[index].data?.length,
                                  itemBuilder: (context, indexCollapse) {
                                    var dataCollapse = controller
                                        .listHistories
                                        .value
                                        .data?[index]
                                        .data?[indexCollapse];
                                    var leaveStatus = dataCollapse?.status;
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
                                    return Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        splashColor:
                                            Color.fromARGB(30, 0, 0, 0),
                                        highlightColor:
                                            Color.fromARGB(30, 0, 0, 0),
                                        onTap: () {
                                          Get.to(
                                            () => DetailLeaveHistoryView(
                                              id: dataCollapse?.id,
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 24),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '${dataCollapse?.start ?? '-'} s/d ${dataCollapse?.end ?? '-'}',
                                                style: GoogleFonts.nunitoSans(
                                                  color: Color(0xff666666),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                '${toBeginningOfSentenceCase(leaveStatus ?? '-')}',
                                                style: GoogleFonts.nunitoSans(
                                                  color: leaveColor,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                              onExpansionChanged: (bool expanded) {
                                controller.listHistories.value.data?[index]
                                    .expanded!.value = !expanded;
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Column(
                children: [
                  SkeletonLine(
                    style: SkeletonLineStyle(
                      height: 12,
                      width: MediaQuery.of(context).size.width / 3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(height: 12),
                  SkeletonAvatar(
                    style: SkeletonAvatarStyle(
                      width: double.infinity,
                      minHeight: MediaQuery.of(context).size.height / 8,
                      maxHeight: MediaQuery.of(context).size.height / 3,
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletons/skeletons.dart';
import '../../../data/custom_bottom_nav.dart';
import '../controllers/salary_controller.dart';
import 'detail_salary_view.dart';

class SalaryView extends GetView<SalaryController> {
  const SalaryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SalaryController());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomBottomNavBar(),
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
          FutureBuilder(
            future: controller.getSalary(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                controller.listSalary.value = snapshot.data!;
                return Obx(
                  () => ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.listSalary.value.data?.length,
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
                                    '${controller.listSalary.value.data?[index].year ?? '-'}',
                                    style: GoogleFonts.montserrat(
                                      color: Color(0xff303030),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Obx(
                                    () => Icon(controller.listSalary.value
                                            .data![index].expanded!.value
                                        ? Icons.keyboard_arrow_down_rounded
                                        : Icons.keyboard_arrow_up_rounded),
                                  ),
                                ],
                              ),
                              tilePadding: EdgeInsets.all(0),
                              trailing: SizedBox(),
                              children: <Widget>[
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: controller.listSalary.value
                                      .data?[index].data?.length,
                                  itemBuilder: (context, indexCollapse) {
                                    return Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        splashColor:
                                            Color.fromARGB(30, 0, 0, 0),
                                        highlightColor:
                                            Color.fromARGB(30, 0, 0, 0),
                                        onTap: () {
                                          Get.to(
                                            () => DetailSalaryView(
                                              id: controller
                                                  .listSalary
                                                  .value
                                                  .data?[index]
                                                  .data?[indexCollapse]
                                                  .id,
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
                                                '${controller.listSalary.value.data?[index].data?[indexCollapse].period?.split(' ')[0] ?? '-'}',
                                                style: GoogleFonts.nunitoSans(
                                                  color: Color(0xff666666),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                'Rp ${controller.listSalary.value.data?[index].data?[indexCollapse].total ?? '0'}',
                                                style: GoogleFonts.nunitoSans(
                                                  color: Color(0xff666666),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
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
                                controller.listSalary.value.data?[index]
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
              return _loadingSalary();
            },
          )
        ],
      ),
    );
  }
}

class _loadingSalary extends StatelessWidget {
  const _loadingSalary({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}

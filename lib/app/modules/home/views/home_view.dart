import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hris_getx/app/modules/login/controllers/login_controller.dart';
import 'package:intl/intl.dart';
import 'package:skeletons/skeletons.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../data/custom_bottom_nav.dart';
import '../../../data/theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    final loginController = Get.put(LoginController());
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    final double padding = 16;
    final double spaceBetween = 40;
    final double responsiveWidth =
        (deviceWidth / 2) - padding - (spaceBetween / 2);

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
            Row(
              children: [
                Material(
                  // decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                  // ),
                  child: InkWell(
                    borderRadius: new BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/icons/setting.png',
                        width: 16,
                        height: 16,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                  // ),
                  child: InkWell(
                    borderRadius: new BorderRadius.circular(50),
                    onTap: () async {
                      await _logoutController(context, loginController);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/icons/logout.png',
                        width: 16,
                        height: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async {
          Get.offAndToNamed(Routes.HOME);
        },
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(32),
            children: [
              _infoProfile(homeController: homeController),
              SizedBox(height: 32),
              _dateInfo(homeController: homeController),
              SizedBox(height: 32),
              _infoTimeAbsent(responsiveWidth: responsiveWidth),
              SizedBox(height: 24),
              _absentInfo(
                homeController: homeController,
              ),
              SizedBox(height: 24),
              _buttonAbsent(homeController: homeController),
              SizedBox(height: 32),
              _attendanceHistory(homeController: homeController),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hadir',
                        style: GoogleFonts.nunitoSans(
                          color: Color(0xff666666),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '10 Hari',
                        style: GoogleFonts.nunitoSans(
                          color: Color(0xff666666),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Terlambat masuk',
                        style: GoogleFonts.nunitoSans(
                          color: Color(0xff666666),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '10 Hari',
                        style: GoogleFonts.nunitoSans(
                          color: Color(0xff666666),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tidak check in / out',
                        style: GoogleFonts.nunitoSans(
                          color: Color(0xff666666),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '10 Hari',
                        style: GoogleFonts.nunitoSans(
                          color: Color(0xff666666),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cuti',
                        style: GoogleFonts.nunitoSans(
                          color: Color(0xff666666),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '10 Hari',
                        style: GoogleFonts.nunitoSans(
                          color: Color(0xff666666),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sakit',
                        style: GoogleFonts.nunitoSans(
                          color: Color(0xff666666),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '-',
                        style: GoogleFonts.nunitoSans(
                          color: Color(0xff666666),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _logoutController(
      BuildContext context, LoginController loginController) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Konfirmasi',
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: RichText(
          text: TextSpan(
            text: 'Apa kamu yakin ingin keluar akun ?',
            style: GoogleFonts.nunitoSans(
              color: Color(0xff666666),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'akun@gmail.com',
                style: GoogleFonts.nunitoSans(
                    fontSize: 12, fontWeight: FontWeight.w700),
              ),
              TextSpan(
                text: ' ?',
                style: GoogleFonts.nunitoSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          TextButton(
            onPressed: () {
              Get.back(closeOverlays: true);
            },
            child: Text(
              'Batal',
              style: GoogleFonts.nunitoSans(
                color: Color(0xffB0BEC4),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          TextButton(
            onPressed: () async {
              Get.back(closeOverlays: true);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    scrollable: true,
                    content: Row(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(width: 14),
                        Text(
                          'Loading...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
              Future.delayed(Duration(seconds: 2), () async {
                await loginController.logout();
              });
            },
            child: Text(
              'Keluar',
              style: GoogleFonts.nunitoSans(
                color: Color(0xffED213A),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _attendanceHistory extends StatelessWidget {
  const _attendanceHistory({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Riwayat Absensi',
          style: GoogleFonts.montserrat(
            color: Color(0xff303030),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 32),
        FutureBuilder<dynamic>(
          future: homeController.getCalendars(),
          builder: (context, snapshot) {
            if (homeController.isLoading.value != true) {
              if (snapshot.hasData) {
                return Obx(
                  () => TableCalendar(
                    eventLoader: (date) {
                      return homeController.calendars.value.data!
                          .where((element) {
                        return DateFormat('yyyy-MM-dd').format(element.date!) ==
                            DateFormat('yyyy-MM-dd').format(date);
                      }).toList();
                    },
                    firstDay: DateTime.utc(2015, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    locale: 'id_ID',
                    focusedDay: homeController.selectedDay.value,
                    selectedDayPredicate: (day) =>
                        isSameDay(day, homeController.selectedDay.value),
                    onDaySelected: (selectedDay, focusedDay) {
                      homeController.focusedDay.value = focusedDay;
                      homeController.selectedDay.value = selectedDay;
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          scrollable: true,
                          actionsAlignment: MainAxisAlignment.center,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: homeController.calendars.value.data!
                                .map(
                                  (calendar) => Obx(
                                    () {
                                      if (DateFormat('yyyy-MM-dd')
                                              .format(calendar.date!) ==
                                          DateFormat('yyyy-MM-dd').format(
                                              homeController
                                                  .selectedDay.value)) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              DateFormat('EEEE, dd MMMM yyyy',
                                                      'id_ID')
                                                  .format(homeController
                                                      .selectedDay.value),
                                              style: GoogleFonts.montserrat(
                                                color: Color(0xff303030),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Jam masuk kerja:',
                                                  style: GoogleFonts.nunitoSans(
                                                    color: Color(0xff303030),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Text(
                                                  '${calendar.checkIn ?? '-'}',
                                                  style: GoogleFonts.nunitoSans(
                                                    color: Color(0xff303030),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Jam pulang kerja:',
                                                  style: GoogleFonts.nunitoSans(
                                                    color: Color(0xff303030),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                Text(
                                                  '${calendar.checkOut ?? '-'}',
                                                  style: GoogleFonts.nunitoSans(
                                                    color: Color(0xff303030),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      } else {
                                        return SizedBox();
                                      }
                                    },
                                  ),
                                )
                                .toList(),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                Get.back(closeOverlays: true);
                              },
                              child: Text(
                                'Ok',
                                style: GoogleFonts.nunitoSans(
                                  color: Color(0xff1F78FF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    calendarFormat: CalendarFormat.month,
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Color(0xFFCA0086), Color(0xFFF962A7)],
                        ),
                      ),
                      markerDecoration: BoxDecoration(
                        color: Colors.pink,
                        shape: BoxShape.circle,
                      ),
                      defaultTextStyle: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                      outsideTextStyle: GoogleFonts.montserrat(
                        color: Color(0xff666666),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                      holidayTextStyle: GoogleFonts.montserrat(
                        color: Color(0xffFF5B5B),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                      weekendTextStyle: GoogleFonts.montserrat(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    calendarBuilders: CalendarBuilders(),
                    weekendDays: [6],
                    headerStyle: HeaderStyle(
                      headerPadding: EdgeInsets.only(bottom: 24),
                      titleTextStyle: GoogleFonts.montserrat(
                        color: Color(0xff009EFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      titleCentered: true,
                      formatButtonVisible: false,
                      rightChevronIcon: Icon(
                        Icons.navigate_next_rounded,
                        size: 18,
                      ),
                      leftChevronIcon: Icon(
                        Icons.navigate_before_rounded,
                        size: 18,
                      ),
                      // rightChevronVisible: false,
                      // leftChevronVisible: false,
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekendStyle: GoogleFonts.montserrat(
                        color: Color(0xffFF5B5B),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                      weekdayStyle: GoogleFonts.montserrat(
                        color: Color(0xff666666),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
            }
            return SkeletonAvatar(
              style: SkeletonAvatarStyle(
                width: double.infinity,
                minHeight: MediaQuery.of(context).size.height / 8,
                maxHeight: MediaQuery.of(context).size.height / 3,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _buttonAbsent extends StatelessWidget {
  _buttonAbsent({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    final dateNow = DateTime.now().toString().substring(0, 10);
    DateTime jamMasuks = DateTime.parse("${dateNow} 09:00:00");
    DateTime jamPulangs = DateTime.parse("${dateNow} 17:00:00");
    DateTime jamSekarangs = DateTime.now();
    return Padding(
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Colors.transparent,
            // elevation: MaterialStateProperty.all(3),
            shadowColor: Colors.transparent,
          ),
          onPressed: jamSekarangs.isBefore(jamPulangs) == true &&
                  homeController.todayAttendance.value.checkIn != null
              ? null
              : () {
                  if (jamSekarangs.isAfter(jamPulangs)) {
                    homeController.statusAtt.value = 'out';
                  }
                  if (jamSekarangs.isBefore(jamMasuks) ||
                      jamSekarangs.isAfter(jamMasuks) &&
                          jamSekarangs.isBefore(jamPulangs)) {
                    homeController.statusAtt.value = 'in';
                  }

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
                    homeController.assignAttendance().then((value) {
                      Get.back(closeOverlays: true);
                      showSnackbarCustom(
                          'Berhasil absen ${homeController.statusAtt.value == 'in' ? 'masuk' : 'pulang'}');
                      Get.offAndToNamed(Routes.HOME);
                    }).catchError((error) {
                      Get.back(closeOverlays: true);
                      showSnackbarCustom(error.message.toString());
                    });
                  });
                },
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Text(
              homeController.todayAttendance.value.checkIn == null &&
                      homeController.todayAttendance.value.checkOut == null
                  ? (homeController.todayAttendance.value.checkIn != null &&
                          homeController.todayAttendance.value.checkOut == null
                      ? 'Absen Pulang'
                      : 'Absen Masuk')
                  : 'Absen Pulang',
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _absentInfo extends StatelessWidget {
  _absentInfo({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: homeController.getTodayAttendance(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    homeController.todayAttendance.value.checkIn != null
                        ? 'assets/icons/absent-in-active.png'
                        : 'assets/icons/absent-in.png',
                    width: 48,
                    height: 48,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jam anda masuk',
                        style: GoogleFonts.nunitoSans(
                          color: Color(0xff303030),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '${homeController.todayAttendance.value.checkIn?.replaceAll(':', ' : ') ?? '-'}',
                        style: GoogleFonts.montserrat(
                          color: Color(0xff009EFF),
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Image.asset(
                    homeController.todayAttendance.value.checkOut != null
                        ? 'assets/icons/absent-out-active.png'
                        : 'assets/icons/absent-out.png',
                    width: 48,
                    height: 48,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jam anda pulang',
                        style: GoogleFonts.nunitoSans(
                          color: Color(0xff303030),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '${homeController.todayAttendance.value.checkOut?.replaceAll(':', ' : ') ?? '-'}',
                        style: GoogleFonts.montserrat(
                          color: Color(0xff009EFF),
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return _loadingTodayAttendance();
      },
    );
  }
}

class _loadingTodayAttendance extends StatelessWidget {
  const _loadingTodayAttendance({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(16),
                width: 56,
                height: 56,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonLine(
                    style: SkeletonLineStyle(
                      height: 12,
                      width: MediaQuery.of(context).size.width / 3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(height: 8),
                  SkeletonLine(
                    style: SkeletonLineStyle(
                      height: 20,
                      width: MediaQuery.of(context).size.width / 2,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(16),
                width: 56,
                height: 56,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonLine(
                    style: SkeletonLineStyle(
                      height: 12,
                      width: MediaQuery.of(context).size.width / 3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(height: 8),
                  SkeletonLine(
                    style: SkeletonLineStyle(
                      height: 20,
                      width: MediaQuery.of(context).size.width / 2,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class _infoTimeAbsent extends StatelessWidget {
  const _infoTimeAbsent({
    Key? key,
    required this.responsiveWidth,
  }) : super(key: key);

  final double responsiveWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: responsiveWidth,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xffF0FBFF),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jam masuk kerja',
                style: GoogleFonts.nunitoSans(
                  color: Color(0xff66D4FF),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '09 : 00',
                  style: GoogleFonts.montserrat(
                    color: Color(0xff4C6493),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'WIB',
                      style: GoogleFonts.nunitoSans(
                        color: Color(0xffBCC7DC),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: responsiveWidth,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xffF0FBFF),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jam pulang kerja',
                style: GoogleFonts.nunitoSans(
                  color: Color(0xff66D4FF),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: '17 : 00',
                  style: GoogleFonts.montserrat(
                    color: Color(0xff4C6493),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'WIB',
                      style: GoogleFonts.nunitoSans(
                        color: Color(0xffBCC7DC),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _infoProfile extends StatelessWidget {
  const _infoProfile({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: homeController.obx(
        (state) => Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xfff2f2f2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                  'assets/icons/user.png',
                  width: 24,
                  height: 24,
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${homeController.profiles.name}',
                    style: GoogleFonts.montserrat(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff4C6493),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '${homeController.profiles.department}',
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff303030),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        onLoading: _buildLoadingProfile(),
      ),
    );
  }
}

class _dateInfo extends StatelessWidget {
  const _dateInfo({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Info absensi pada',
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xff303030),
          ),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/icons/calendar.png',
              width: 12,
              height: 12,
            ),
            SizedBox(width: 8),
            Text(
              '${homeController.dayNow}',
              style: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xff666666),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _buildLoadingProfile extends StatelessWidget {
  const _buildLoadingProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16),
            width: 56,
            height: 56,
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonLine(
                style: SkeletonLineStyle(
                  height: 20,
                  width: MediaQuery.of(context).size.width / 2,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              SizedBox(height: 8),
              SkeletonLine(
                style: SkeletonLineStyle(
                  height: 12,
                  width: MediaQuery.of(context).size.width / 3,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

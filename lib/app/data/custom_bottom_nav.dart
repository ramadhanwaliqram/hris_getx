import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routes/app_pages.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24),
      height: 92,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 8, color: Colors.black.withOpacity(0.08)),
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          topLeft: Radius.circular(50),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Get.offAndToNamed(Routes.HOME);
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/calendar.png',
                  width: 24,
                  color: Get.currentRoute == '/home'
                      ? Color(0xff009EFF)
                      : Color(0xffc4c4c4),
                ),
                SizedBox(height: 4),
                Text(
                  'Absensi',
                  style: GoogleFonts.nunitoSans(
                    color: Get.currentRoute == '/home'
                        ? Color(0xff009EFF)
                        : Color(0xffc4c4c4),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.PAID_LEAVE);
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/content.png',
                  width: 24,
                  color: Get.currentRoute == '/paid-leave'
                      ? Color(0xff009EFF)
                      : Color(0xffc4c4c4),
                ),
                SizedBox(height: 4),
                Text(
                  'Cuti',
                  style: GoogleFonts.nunitoSans(
                    color: Get.currentRoute == '/paid-leave'
                        ? Color(0xff009EFF)
                        : Color(0xffc4c4c4),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.SALARY);
            },
            child: Column(
              children: [
                Image.asset(
                  'assets/icons/receipt.png',
                  width: 24,
                  color: Get.currentRoute == '/salary'
                      ? Color(0xff009EFF)
                      : Color(0xffc4c4c4),
                ),
                SizedBox(height: 4),
                Text(
                  'Gaji',
                  style: GoogleFonts.nunitoSans(
                    color: Get.currentRoute == '/salary'
                        ? Color(0xff009EFF)
                        : Color(0xffc4c4c4),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

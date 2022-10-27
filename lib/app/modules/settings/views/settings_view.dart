import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hris_getx/app/modules/login/controllers/login_controller.dart';
import 'package:hris_getx/app/modules/settings/views/change_password_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletons/skeletons.dart';
import '../../../data/theme.dart';
import '../../../routes/app_pages.dart';
import '../controllers/settings_controller.dart';
import 'package:file_picker/file_picker.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());
    final loginController = Get.put(LoginController());
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
              Get.offAndToNamed(Routes.HOME);
            },
          ),
        ),
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: RefreshIndicator(
          onRefresh: () async {
            Get.offAndToNamed(Routes.SETTINGS);
          },
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.all(24),
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Profil",
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff303030),
                        ),
                      ),
                      SizedBox(height: 24),
                      controller.obx(
                        (state) => Obx(
                          () => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'NIK',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffc4c4c4),
                                ),
                              ),
                              Text(
                                '${controller.profiles.nik}',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff4C6493),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Nama',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffc4c4c4),
                                ),
                              ),
                              Text(
                                '${controller.profiles.name}',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff4C6493),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Tempat & tanggal lahir',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffc4c4c4),
                                ),
                              ),
                              Text(
                                '${controller.profiles.birth ?? '-'}',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff4C6493),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Jenis kelamin',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffc4c4c4),
                                ),
                              ),
                              if (controller.profiles.gender == 'female') ...[
                                Text(
                                  'Perempuan',
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff4C6493),
                                  ),
                                ),
                              ] else if (controller.profiles.gender ==
                                  'male') ...[
                                Text(
                                  'Laki-Laki',
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff4C6493),
                                  ),
                                ),
                              ] else ...[
                                Text(
                                  '-',
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff4C6493),
                                  ),
                                ),
                              ],
                              SizedBox(height: 8),
                              Text(
                                'Departemen',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffc4c4c4),
                                ),
                              ),
                              Text(
                                '${controller.profiles.department ?? '-'}',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff4C6493),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '*untuk mengubah data di atas harap mengunjungi pihak manajemen',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff4C6493),
                                ),
                              ),
                              SizedBox(height: 32),
                              Container(
                                width: 100,
                                height: 100,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 10,
                                      child: Obx(
                                        () {
                                          File file = File(controller
                                              .selectedImagePath.value);
                                          if (controller
                                                  .selectedImagePath.value !=
                                              '') {
                                            print('ini file ${file}');
                                            return Container(
                                              width: 72,
                                              height: 72,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                child: Image.file(
                                                  file,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Container(
                                              width: 72,
                                              height: 72,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                child: FadeInImage(
                                                  placeholder: AssetImage(
                                                      'assets/images/no-image.jpg'),
                                                  image: NetworkImage(
                                                      '${controller.profiles.profilePicture}'),
                                                  fit: BoxFit.cover,
                                                  imageErrorBuilder: (context,
                                                      error, stackTrace) {
                                                    return Image.asset(
                                                        'assets/images/no-image.jpg');
                                                  },
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                    Obx(
                                      () => Positioned(
                                        top: 0,
                                        right: 20,
                                        child: controller
                                                    .selectedImagePath.value !=
                                                ''
                                            ? Material(
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  splashColor: Color.fromARGB(
                                                      30, 0, 0, 0),
                                                  highlightColor:
                                                      Color.fromARGB(
                                                          30, 0, 0, 0),
                                                  onTap: () async {
                                                    await controller
                                                        .updateProfile()
                                                        .then(
                                                          (value) =>
                                                              showSnackbarCustom(
                                                                  'Berhasil ubah foto profile'),
                                                        )
                                                        .catchError(
                                                          (error) =>
                                                              showSnackbarCustom(
                                                                  error.message
                                                                      .toString()),
                                                        );
                                                    controller.selectedImagePath
                                                        .value = '';
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(7),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: Color(0xff009EFF),
                                                    ),
                                                    child: Image.asset(
                                                      'assets/icons/checklist.png',
                                                      width: 10,
                                                      height: 10,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Material(
                                                color: Colors.transparent,
                                                child: InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  splashColor: Color.fromARGB(
                                                      30, 0, 0, 0),
                                                  highlightColor:
                                                      Color.fromARGB(
                                                          30, 0, 0, 0),
                                                  onTap: () {
                                                    showModalBottomSheet(
                                                      context: context,
                                                      builder: (context) {
                                                        return Container(
                                                          height: 200,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight: Radius
                                                                  .circular(20),
                                                            ),
                                                          ),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Pilih media yang ingin digunakan : ',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 10),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            10),
                                                                height: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xff009EFF),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                child:
                                                                    TextButton(
                                                                  onPressed:
                                                                      () async {
                                                                    Get.back();
                                                                    final result =
                                                                        await FilePicker
                                                                            .platform
                                                                            .pickFiles(
                                                                      type: FileType
                                                                          .custom,
                                                                      allowedExtensions: [
                                                                        'pdf',
                                                                        'jpg',
                                                                        'png',
                                                                        'jpeg'
                                                                      ],
                                                                    );
                                                                    if (result ==
                                                                        null)
                                                                      return;
                                                                    final file =
                                                                        result
                                                                            .files
                                                                            .first;
                                                                    controller
                                                                            .pathFile
                                                                            .value =
                                                                        file.path!;
                                                                    controller
                                                                            .nameFile
                                                                            .value =
                                                                        file.name;
                                                                    controller
                                                                            .sizeFile
                                                                            .value =
                                                                        file.size;
                                                                    controller
                                                                            .selectedImagePath
                                                                            .value =
                                                                        file.path!;
                                                                  },
                                                                  child: Text(
                                                                    'Media',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        bottom:
                                                                            10),
                                                                height: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xff009EFF),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                child:
                                                                    TextButton(
                                                                  onPressed:
                                                                      () async {
                                                                    Get.back();
                                                                    await controller
                                                                        .getImage(
                                                                      ImageSource
                                                                          .camera,
                                                                    );
                                                                  },
                                                                  child: Text(
                                                                    'Camera',
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(7),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      color: Color(0xff009EFF),
                                                    ),
                                                    child: Image.asset(
                                                      'assets/icons/pencil.png',
                                                      width: 10,
                                                      height: 10,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 24),
                              Obx(
                                () => Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Color(0xffF2F2F2),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: TextField(
                                    controller: controller.phoneNumberC,
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                      color: controller.handleChangePhoneNumber
                                                  .value ==
                                              true
                                          ? Color(0xff888888)
                                          : Color(0xff303030),
                                    ),
                                    autocorrect: false,
                                    readOnly: controller
                                        .handleChangePhoneNumber.value,
                                    keyboardType: TextInputType.phone,
                                    textInputAction: TextInputAction.send,
                                    onSubmitted: (value) async {
                                      await controller
                                          .updateProfile()
                                          .then(
                                            (value) => showSnackbarCustom(
                                                'Berhasil ubah No. Telepon ✔'),
                                          )
                                          .catchError(
                                            (error) => showSnackbarCustom(
                                                error.message.toString()),
                                          );
                                      controller.handleChangePhoneNumber.value =
                                          true;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "No. Telepon",
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
                              ),
                              SizedBox(height: 4),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Color.fromARGB(30, 0, 0, 0),
                                  highlightColor: Color.fromARGB(30, 0, 0, 0),
                                  onTap: () {
                                    controller.handleChangePhoneNumber.value =
                                        !controller
                                            .handleChangePhoneNumber.value;
                                  },
                                  child: Text(
                                    'Ubah',
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff009EFF),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Obx(
                                () => Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: Color(0xffF2F2F2),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: TextField(
                                    controller: controller.addressC,
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      decoration: TextDecoration.none,
                                      color: controller
                                                  .handleChangeAddress.value ==
                                              true
                                          ? Color(0xff888888)
                                          : Color(0xff303030),
                                    ),
                                    autocorrect: false,
                                    readOnly:
                                        controller.handleChangeAddress.value,
                                    textInputAction: TextInputAction.send,
                                    onSubmitted: (value) async {
                                      await controller
                                          .updateProfile()
                                          .then(
                                            (value) => showSnackbarCustom(
                                                'Berhasil ubah Alamat ✔'),
                                          )
                                          .catchError(
                                            (error) => showSnackbarCustom(
                                                error.message.toString()),
                                          );
                                      controller.handleChangeAddress.value =
                                          true;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Alamat",
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
                              ),
                              SizedBox(height: 4),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Color.fromARGB(30, 0, 0, 0),
                                  highlightColor: Color.fromARGB(30, 0, 0, 0),
                                  onTap: () {
                                    controller.handleChangeAddress.value =
                                        !controller.handleChangeAddress.value;
                                  },
                                  child: Text(
                                    'Ubah',
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff009EFF),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 40),
                              Text(
                                "Akun",
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff303030),
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Email',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffc4c4c4),
                                ),
                              ),
                              Text(
                                '${controller.profiles.email}',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff4C6493),
                                ),
                              ),
                              SizedBox(height: 16),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => ChangePasswordView());
                                },
                                child: Text(
                                  'Ubah Password',
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff009EFF),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
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
                                          text:
                                              'Apa kamu yakin ingin keluar akun ',
                                          style: GoogleFonts.nunitoSans(
                                            color: Color(0xff666666),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  '${controller.profiles.email}',
                                              style: GoogleFonts.nunitoSans(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
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
                                      actionsAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                            Future.delayed(Duration(seconds: 2),
                                                () async {
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
                                },
                                child: Text(
                                  'Logout',
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff303030),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onLoading: _loadingSettingProfile(),
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

class _loadingSettingProfile extends StatelessWidget {
  const _loadingSettingProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkeletonLine(
          style: SkeletonLineStyle(
            width: 20,
            height: 10,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 4),
        SkeletonLine(
          style: SkeletonLineStyle(
            width: 123,
            height: 12,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 8),
        SkeletonLine(
          style: SkeletonLineStyle(
            width: 28,
            height: 10,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 4),
        SkeletonLine(
          style: SkeletonLineStyle(
            width: 95,
            height: 12,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 8),
        SkeletonLine(
          style: SkeletonLineStyle(
            width: 108,
            height: 10,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 4),
        SkeletonLine(
          style: SkeletonLineStyle(
            width: 147,
            height: 12,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 8),
        SkeletonLine(
          style: SkeletonLineStyle(
            width: 61,
            height: 10,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 4),
        SkeletonLine(
          style: SkeletonLineStyle(
            width: 45,
            height: 12,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 8),
        SkeletonLine(
          style: SkeletonLineStyle(
            width: 58,
            height: 10,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 4),
        SkeletonLine(
          style: SkeletonLineStyle(
            width: 89,
            height: 12,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 8),
        SkeletonLine(
          style: SkeletonLineStyle(
            width: 250,
            height: 12,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 8),
        SkeletonAvatar(
          style: SkeletonAvatarStyle(
            borderRadius: BorderRadius.circular(16),
            width: 72,
            height: 72,
          ),
        ),
        SizedBox(height: 24),
        SkeletonLine(
          style: SkeletonLineStyle(
            width: 170,
            height: 50,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 4),
        SkeletonLine(
          style: SkeletonLineStyle(
            width: 50,
            height: 12,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 24),
        SkeletonLine(
          style: SkeletonLineStyle(
            width: 170,
            height: 50,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 4),
        SkeletonLine(
          style: SkeletonLineStyle(
            width: 50,
            height: 12,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }
}

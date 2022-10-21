// To parse this JSON data, do
//
//     final todayAttendanceModel = todayAttendanceModelFromJson(jsonString);

import 'dart:convert';

TodayAttendanceModel todayAttendanceModelFromJson(String str) =>
    TodayAttendanceModel.fromJson(json.decode(str));

String todayAttendanceModelToJson(TodayAttendanceModel data) =>
    json.encode(data.toJson());

class TodayAttendanceModel {
  TodayAttendanceModel({
    this.checkIn,
    this.checkOut,
    this.isLate,
    this.isFast,
    this.absentReasons,
  });

  String? checkIn;
  String? checkOut;
  int? isLate;
  int? isFast;
  dynamic absentReasons;

  factory TodayAttendanceModel.fromJson(Map<String, dynamic>? json) =>
      TodayAttendanceModel(
        checkIn: json?["check_in"],
        checkOut: json?["check_out"],
        isLate: json?["is_late"],
        isFast: json?["is_fast"],
        absentReasons: json?["absent_reasons"],
      );

  Map<String, dynamic> toJson() => {
        "check_in": checkIn,
        "check_out": checkOut,
        "is_late": isLate,
        "is_fast": isFast,
        "absent_reasons": absentReasons,
      };
}

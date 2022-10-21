// To parse this JSON data, do
//
//     final calendarModel = calendarModelFromJson(jsonString);

import 'dart:convert';

CalendarModel calendarModelFromJson(String str) =>
    CalendarModel.fromJson(json.decode(str));

String calendarModelToJson(CalendarModel data) => json.encode(data.toJson());

class CalendarModel {
  CalendarModel({
    this.data,
  });

  List<DataCalendar>? data;

  factory CalendarModel.fromJson(Map<String, dynamic>? json) => CalendarModel(
        data: List<DataCalendar>.from(
            json?["data"].map((x) => DataCalendar.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DataCalendar {
  DataCalendar({
    this.id,
    this.userId,
    this.date,
    this.checkIn,
    this.checkOut,
    this.isLate,
    this.isFast,
    this.absentReasons,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  DateTime? date;
  String? checkIn;
  String? checkOut;
  int? isLate;
  int? isFast;
  dynamic absentReasons;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory DataCalendar.fromJson(Map<String, dynamic>? json) => DataCalendar(
        id: json?["id"],
        userId: json?["user_id"],
        date: DateTime.parse(json?["date"]),
        checkIn: json?["check_in"] == null ? null : json?["check_in"],
        checkOut: json?["check_out"],
        isLate: json?["is_late"],
        isFast: json?["is_fast"],
        absentReasons: json?["absent_reasons"],
        createdAt: DateTime.parse(json?["created_at"]),
        updatedAt: DateTime.parse(json?["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "date":
            "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "check_in": checkIn == null ? null : checkIn,
        "check_out": checkOut,
        "is_late": isLate,
        "is_fast": isFast,
        "absent_reasons": absentReasons,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

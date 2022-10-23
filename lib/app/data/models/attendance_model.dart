// To parse this JSON data, do
//
//     final attendanceModel = attendanceModelFromJson(jsonString);

import 'dart:convert';

AttendanceModel attendanceModelFromJson(String str) =>
    AttendanceModel.fromJson(json.decode(str));

String attendanceModelToJson(AttendanceModel data) =>
    json.encode(data.toJson());

class AttendanceModel {
  AttendanceModel({
    this.data,
  });

  Data? data;

  factory AttendanceModel.fromJson(Map<String, dynamic>? json) =>
      AttendanceModel(
        data: Data.fromJson(json?["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.attendances,
    this.summary,
  });

  List<Attendance>? attendances;
  Summary? summary;

  factory Data.fromJson(Map<String, dynamic>? json) => Data(
        attendances: List<Attendance>.from(
            json?["attendances"].map((x) => Attendance.fromJson(x))),
        summary: Summary.fromJson(json?["summary"]),
      );

  Map<String, dynamic> toJson() => {
        "attendances": List<dynamic>.from(attendances!.map((x) => x.toJson())),
        "summary": summary?.toJson(),
      };
}

class Attendance {
  Attendance({
    this.id,
    this.date,
    this.checkIn,
    this.checkOut,
    this.isLate,
    this.isFast,
    this.absentReasons,
  });

  int? id;
  String? date;
  String? checkIn;
  String? checkOut;
  int? isLate;
  int? isFast;
  AbsentReasons? absentReasons;

  factory Attendance.fromJson(Map<String, dynamic>? json) => Attendance(
        id: json?["id"],
        date: json?["date"],
        checkIn: json?["check_in"],
        checkOut: json?["check_out"],
        isLate: json?["is_late"],
        isFast: json?["is_fast"],
        absentReasons: absentReasonsValues.map[json?["absent_reasons"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "check_in": checkIn,
        "check_out": checkOut,
        "is_late": isLate,
        "is_fast": isFast,
        "absent_reasons": absentReasonsValues.reverse[absentReasons],
      };
}

enum AbsentReasons { EMPTY, NULL }

final absentReasonsValues =
    EnumValues({"-": AbsentReasons.EMPTY, "[NULL]": AbsentReasons.NULL});

class Summary {
  Summary({
    this.present,
    this.userLate,
    this.notCheck,
    this.leave,
    this.sick,
    this.absent,
  });

  int? present;
  int? userLate;
  int? notCheck;
  int? leave;
  int? sick;
  int? absent;

  factory Summary.fromJson(Map<String, dynamic>? json) => Summary(
        present: json?["present"],
        userLate: json?["userLate"],
        notCheck: json?["not_check"],
        leave: json?["leave"],
        sick: json?["sick"],
        absent: json?["absent"],
      );

  Map<String, dynamic> toJson() => {
        "present": present,
        "userLate": userLate,
        "not_check": notCheck,
        "leave": leave,
        "sick": sick,
        "absent": absent,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}

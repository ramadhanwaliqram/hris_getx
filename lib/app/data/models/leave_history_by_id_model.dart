// To parse this JSON data, do
//
//     final leaveHistoryByIdModel = leaveHistoryByIdModelFromJson(jsonString);

import 'dart:convert';

LeaveHistoryByIdModel leaveHistoryByIdModelFromJson(String str) =>
    LeaveHistoryByIdModel.fromJson(json.decode(str));

String leaveHistoryByIdModelToJson(LeaveHistoryByIdModel data) =>
    json.encode(data.toJson());

class LeaveHistoryByIdModel {
  LeaveHistoryByIdModel({
    this.start,
    this.end,
    this.totalDays,
    this.reasons,
    this.status,
    this.reasonRejected,
    this.chiefSignature,
  });

  String? start;
  String? end;
  int? totalDays;
  String? reasons;
  String? status;
  dynamic reasonRejected;
  String? chiefSignature;

  factory LeaveHistoryByIdModel.fromJson(Map<String, dynamic>? json) =>
      LeaveHistoryByIdModel(
        start: json?["start"],
        end: json?["end"],
        totalDays: json?["total_days"],
        reasons: json?["reasons"],
        status: json?["status"],
        reasonRejected: json?["reason_rejected"],
        chiefSignature: json?["chief_signature"],
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
        "total_days": totalDays,
        "reasons": reasons,
        "status": status,
        "reason_rejected": reasonRejected,
        "chief_signature": chiefSignature,
      };
}

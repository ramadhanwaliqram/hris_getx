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
    this.createdAt,
    this.start,
    this.end,
    this.totalDays,
    this.reasons,
    this.status,
    this.reasonRejected,
    this.assignBy,
    this.chiefSignature,
  });

  String? createdAt;
  String? start;
  String? end;
  int? totalDays;
  String? reasons;
  String? status;
  dynamic reasonRejected;
  String? assignBy;
  String? chiefSignature;

  factory LeaveHistoryByIdModel.fromJson(Map<String, dynamic>? json) =>
      LeaveHistoryByIdModel(
        createdAt: json?["created_at"],
        start: json?["start"],
        end: json?["end"],
        totalDays: json?["total_days"],
        reasons: json?["reasons"],
        status: json?["status"],
        reasonRejected: json?["reason_rejected"],
        assignBy: json?["assign_by"],
        chiefSignature: json?["chief_signature"],
      );

  Map<String, dynamic> toJson() => {
        "created_at": createdAt,
        "start": start,
        "end": end,
        "total_days": totalDays,
        "reasons": reasons,
        "status": status,
        "reason_rejected": reasonRejected,
        "assign_by": assignBy,
        "chief_signature": chiefSignature,
      };
}

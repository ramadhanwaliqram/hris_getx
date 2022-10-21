// To parse this JSON data, do
//
//     final leaveHistoryModel = leaveHistoryModelFromJson(jsonString);

import 'dart:convert';

LeaveHistoryModel leaveHistoryModelFromJson(String str) =>
    LeaveHistoryModel.fromJson(json.decode(str));

String leaveHistoryModelToJson(LeaveHistoryModel data) =>
    json.encode(data.toJson());

class LeaveHistoryModel {
  LeaveHistoryModel({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<LeaveHistoryModelData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory LeaveHistoryModel.fromJson(Map<String, dynamic>? json) =>
      LeaveHistoryModel(
        currentPage: json?["current_page"],
        data: List<LeaveHistoryModelData>.from(
            json?["data"].map((x) => LeaveHistoryModelData.fromJson(x))),
        firstPageUrl: json?["first_page_url"],
        from: json?["from"],
        lastPage: json?["last_page"],
        lastPageUrl: json?["last_page_url"],
        links: List<Link>.from(json?["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json?["next_page_url"],
        path: json?["path"],
        perPage: json?["per_page"],
        prevPageUrl: json?["prev_page_url"],
        to: json?["to"],
        total: json?["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class LeaveHistoryModelData {
  LeaveHistoryModelData({
    this.year,
    this.data,
  });

  int? year;
  List<Data>? data;

  factory LeaveHistoryModelData.fromJson(Map<String, dynamic>? json) =>
      LeaveHistoryModelData(
        year: json?["year"],
        data: List<Data>.from(json?["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.id,
    this.start,
    this.end,
    this.status,
    this.createdAt,
  });

  int? id;
  String? start;
  String? end;
  String? status;
  String? createdAt;

  factory Data.fromJson(Map<String, dynamic>? json) => Data(
        id: json?["id"],
        start: json?["start"],
        end: json?["end"],
        status: json?["status"],
        createdAt: json?["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "start": start,
        "end": end,
        "status": status,
        "created_at": createdAt,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic>? json) => Link(
        url: json?["url"] == null ? null : json?["url"],
        label: json?["label"],
        active: json?["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label,
        "active": active,
      };
}

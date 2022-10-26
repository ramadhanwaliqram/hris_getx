// To parse this JSON data, do
//
//     final salaryModel = salaryModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

SalaryModel salaryModelFromJson(String str) =>
    SalaryModel.fromJson(json.decode(str));

String salaryModelToJson(SalaryModel data) => json.encode(data.toJson());

class SalaryModel {
  SalaryModel({
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
  List<SalaryModelData>? data;
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

  factory SalaryModel.fromJson(Map<String, dynamic>? json) => SalaryModel(
        currentPage: json?["current_page"],
        data: List<SalaryModelData>.from(
            json?["data"].map((x) => SalaryModelData.fromJson(x))),
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

class SalaryModelData {
  SalaryModelData({
    this.year,
    this.expanded,
    this.data,
  });

  int? year;
  RxBool? expanded;
  List<Data>? data;

  factory SalaryModelData.fromJson(Map<String, dynamic>? json) =>
      SalaryModelData(
        year: json?["year"],
        expanded: false.obs,
        data: List<Data>.from(json?["data"].map((x) => Data.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "year": year,
        "expanded": expanded,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    this.id,
    this.period,
    this.total,
  });

  int? id;
  String? period;
  String? total;

  factory Data.fromJson(Map<String, dynamic>? json) => Data(
        id: json?["id"],
        period: json?["period"],
        total: json?["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "period": period,
        "total": total,
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

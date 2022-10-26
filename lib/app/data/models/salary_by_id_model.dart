// To parse this JSON data, do
//
//     final salaryModelById = salaryModelByIdFromJson(jsonString);

import 'dart:convert';

SalaryModelById salaryModelByIdFromJson(String str) =>
    SalaryModelById.fromJson(json.decode(str));

String salaryModelByIdToJson(SalaryModelById data) =>
    json.encode(data.toJson());

class SalaryModelById {
  SalaryModelById({
    this.period,
    this.salary,
    this.reward,
    this.additionalSalary,
    this.lateCharge,
    this.attendanceFine,
    this.checkoutFine,
    this.otherSalaryDeductions,
    this.additionalInformation,
    this.reductionInformation,
    this.total,
  });

  String? period;
  int? salary;
  int? reward;
  int? additionalSalary;
  int? lateCharge;
  int? attendanceFine;
  int? checkoutFine;
  int? otherSalaryDeductions;
  dynamic additionalInformation;
  dynamic reductionInformation;
  int? total;

  factory SalaryModelById.fromJson(Map<String, dynamic>? json) =>
      SalaryModelById(
        period: json?["period"],
        salary: json?["salary"],
        reward: json?["reward"],
        additionalSalary: json?["additional_salary"],
        lateCharge: json?["late_charge"],
        attendanceFine: json?["attendance_fine"],
        checkoutFine: json?["checkout_fine"],
        otherSalaryDeductions: json?["other_salary_deductions"],
        additionalInformation: json?["additional_information"],
        reductionInformation: json?["reduction_information"],
        total: json?["total"],
      );

  Map<String, dynamic> toJson() => {
        "period": period,
        "salary": salary,
        "reward": reward,
        "additional_salary": additionalSalary,
        "late_charge": lateCharge,
        "attendance_fine": attendanceFine,
        "checkout_fine": checkoutFine,
        "other_salary_deductions": otherSalaryDeductions,
        "additional_information": additionalInformation,
        "reduction_information": reductionInformation,
        "total": total,
      };
}

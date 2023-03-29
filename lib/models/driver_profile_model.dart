

import 'dart:convert';

DriverProfileModel driverProfileModelFromJson(String str) => DriverProfileModel.fromJson(json.decode(str));

String driverProfileModelToJson(DriverProfileModel data) => json.encode(data.toJson());

class DriverProfileModel {
  DriverProfileModel({
    this.statusCode,
    this.code,
    this.message,
    this.body,
  });

  int? statusCode;
  int? code;
  String? message;
  Body? body;

  factory DriverProfileModel.fromJson(Map<String, dynamic> json) => DriverProfileModel(
    statusCode: json["statusCode"],
    code: json["code"],
    message: json["message"],
    body: Body.fromJson(json["body"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "code": code,
    "message": message,
    "body": body!.toJson(),
  };
}

class Body {
  Body({
    this.name,
    this.district,
    this.contact,
    this.licenseNumber,
    this.expiryDate,
  });

  String? name;
  String? district;
  String? contact;
  String? licenseNumber;
  DateTime? expiryDate;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
    name: json["name"],
    district: json["district"],
    contact: json["contact"],
    licenseNumber: json["licenseNumber"],
    expiryDate: DateTime.parse(json["expiryDate"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "district": district,
    "contact": contact,
    "licenseNumber": licenseNumber,
    "expiryDate": "${expiryDate!.year.toString().padLeft(4, '0')}-${expiryDate!.month.toString().padLeft(2, '0')}-${expiryDate!.day.toString().padLeft(2, '0')}",
  };
}

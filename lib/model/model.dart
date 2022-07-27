// To parse this JSON data, do
//
//     final fuelModel = fuelModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FuelModel fuelModelFromJson(String str) => FuelModel.fromJson(json.decode(str));

String fuelModelToJson(FuelModel data) => json.encode(data.toJson());

class FuelModel {
  FuelModel({
    required this.data,
    required this.meta,
  });

  final Data data;
  final Meta meta;

  factory FuelModel.fromJson(Map<String, dynamic> json) => FuelModel(
        data: Data.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "meta": meta.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.attributes,
  });

  final int id;
  final Attributes attributes;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  Attributes({
    required this.recordDate,
    required this.petrolRatePerLitre,
    required this.dieselRatePerLitre,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
  });

  final DateTime recordDate;
  final int petrolRatePerLitre;
  final dynamic dieselRatePerLitre;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        recordDate: DateTime.parse(json["record_date"]),
        petrolRatePerLitre: json["petrol_rate_per_litre"],
        dieselRatePerLitre: json["diesel_rate_per_litre"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "record_date":
            "${recordDate.year.toString().padLeft(4, '0')}-${recordDate.month.toString().padLeft(2, '0')}-${recordDate.day.toString().padLeft(2, '0')}",
        "petrol_rate_per_litre": petrolRatePerLitre,
        "diesel_rate_per_litre": dieselRatePerLitre,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
      };
}

class Meta {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> json) => Meta();

  Map<String, dynamic> toJson() => {};
}

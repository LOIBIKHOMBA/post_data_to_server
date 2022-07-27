// To parse this JSON data, do
//
//     final fuelModel2 = fuelModel2FromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

FuelModel2 fuelModel2FromJson(String str) =>
    FuelModel2.fromJson(json.decode(str));

String fuelModel2ToJson(FuelModel2 data) => json.encode(data.toJson());

class FuelModel2 {
  FuelModel2({
    required this.data,
    required this.meta,
  });

  final List<Datum> data;
  final Meta meta;

  factory FuelModel2.fromJson(Map<String, dynamic> json) => FuelModel2(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "meta": meta.toJson(),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.attributes,
  });

  final int id;
  final Attributes attributes;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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

  final DateTime? recordDate;
  final int petrolRatePerLitre;
  final int dieselRatePerLitre;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        recordDate: json["record_date"] == null
            ? null
            : DateTime.parse(json["record_date"]),
        petrolRatePerLitre: json["petrol_rate_per_litre"],
        dieselRatePerLitre: json["diesel_rate_per_litre"] == null
            ? null
            : json["diesel_rate_per_litre"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        publishedAt: DateTime.parse(json["publishedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "record_date": recordDate == null
            ? null
            : "${recordDate!.year.toString().padLeft(4, '0')}-${recordDate!.month.toString().padLeft(2, '0')}-${recordDate!.day.toString().padLeft(2, '0')}",
        "petrol_rate_per_litre": petrolRatePerLitre,
        "diesel_rate_per_litre":
            dieselRatePerLitre == null ? null : dieselRatePerLitre,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "publishedAt": publishedAt.toIso8601String(),
      };
}

class Meta {
  Meta({
    required this.pagination,
  });

  final Pagination pagination;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination.toJson(),
      };
}

class Pagination {
  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}

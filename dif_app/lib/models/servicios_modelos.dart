// To parse this JSON data, do
//
//     final servicios = serviciosFromMap(jsonString);

// ignore_for_file: unnecessary_null_in_if_null_operators

import 'dart:convert';

class Servicios {
  Servicios({
    this.descripcin,
    this.nombreCategora,
    this.subservicios,
  });

  String? descripcin;
  String? nombreCategora;
  List<Subservicio>? subservicios;

  factory Servicios.fromJson(String str) => Servicios.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Servicios.fromMap(Map<String, dynamic> json) => Servicios(
        descripcin: json["descripción"] ?? null,
        nombreCategora: json["nombreCategoría"] ?? null,
        subservicios: json["subservicios"] == null
            ? null
            : List<Subservicio>.from(
                json["subservicios"].map((x) => Subservicio.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "descripción": descripcin ?? null,
        "nombreCategoría": nombreCategora ?? null,
        "subservicios": subservicios == null
            ? null
            : List<dynamic>.from(subservicios!.map((x) => x.toMap())),
      };
}

class Subservicio {
  Subservicio({
    this.descripcin,
    this.localidades,
    this.nombreSub,
    this.urlImagen,
  });

  String? descripcin;
  List<Localidade>? localidades;
  String? nombreSub;
  String? urlImagen;

  factory Subservicio.fromJson(String str) =>
      Subservicio.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Subservicio.fromMap(Map<String, dynamic> json) => Subservicio(
        descripcin: json["descripción"] ?? null,
        localidades: json["localidades"] == null
            ? null
            : List<Localidade>.from(
                json["localidades"].map((x) => Localidade.fromMap(x))),
        nombreSub: json["nombreSub"] ?? null,
        urlImagen: json["urlImagen"] ?? null,
      );

  Map<String, dynamic> toMap() => {
        "descripción": descripcin ?? null,
        "localidades": localidades == null
            ? null
            : List<dynamic>.from(localidades!.map((x) => x.toMap())),
        "nombreSub": nombreSub ?? null,
        "urlImagen": urlImagen ?? null,
      };
}

class Localidade {
  Localidade({
    this.direccin,
    this.nombrePlantel,
  });

  String? direccin;
  String? nombrePlantel;

  factory Localidade.fromJson(String str) =>
      Localidade.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Localidade.fromMap(Map<String, dynamic> json) => Localidade(
        direccin: json["dirección"] ?? null,
        nombrePlantel: json["nombrePlantel"] ?? null,
      );

  Map<String, dynamic> toMap() => {
        "dirección": direccin ?? null,
        "nombrePlantel": nombrePlantel ?? null,
      };
}

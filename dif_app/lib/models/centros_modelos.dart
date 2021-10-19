// ignore_for_file: prefer_if_null_operators, non_constant_identifier_names

import 'dart:convert';

class Centro {
  Centro({
    this.datos,
    this.direccion,
    this.horarioDeAtencion,
    this.nombreCentro,
    this.telefono,
    this.urlImagen,
    this.lat,
    this.long,
  });

  Datos? datos;
  String? direccion;
  String? horarioDeAtencion;
  String? nombreCentro;
  String? telefono;
  String? urlImagen;
  double? lat;
  double? long;

  factory Centro.fromJson(String str) => Centro.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Centro.fromMap(Map<String, dynamic> json) => Centro(
        datos: Datos.fromMap(json["datos"]),
        direccion: json["direccion"],
        horarioDeAtencion: json["horarioDeAtencion"],
        lat: json["lat"].toDouble(),
        long: json["long"].toDouble(),
        nombreCentro: json["nombreCentro"],
        telefono: json["telefono"],
        urlImagen: json["urlImagen"],
      );

  Map<String, dynamic> toMap() => {
        "datos": datos!.toMap(),
        "direccion": direccion,
        "horarioDeAtencion": horarioDeAtencion,
        "lat": lat,
        "long": long,
        "nombreCentro": nombreCentro,
        "telefono": telefono,
        "urlImagen": urlImagen,
      };
}

class Datos {
  Datos({
    this.descripcin,
    this.servicios,
  });

  String? descripcin;
  List<String>? servicios;

  factory Datos.fromJson(String str) => Datos.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datos.fromMap(Map<String, dynamic> json) => Datos(
        descripcin: json["descripción"],
        servicios: List<String>.from(json["servicios"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "descripción": descripcin,
        "servicios": List<dynamic>.from(servicios!.map((x) => x)),
      };
}

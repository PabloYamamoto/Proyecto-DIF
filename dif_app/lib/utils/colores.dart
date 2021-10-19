// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Colores {
  Color getAmarillo(double opacity) {
    return Color.fromRGBO(255, 187, 68, opacity);
  }

  Color getNaranja(double opacity) {
    return Color.fromRGBO(250, 143, 37, opacity);
  }

  Color getMorado(double opacity) {
    return Color.fromRGBO(8, 51, 143, opacity);
  }

  Color getAzul(double opacity) {
    return Color.fromRGBO(0, 96, 255, opacity);
  }

  Color getAzulMedio(double opacity) {
    return Color.fromRGBO(0, 117, 192, opacity);
  }

  Color getAzulClaro(double opacity) {
    return Color.fromRGBO(0, 155, 255, opacity);
  }
}

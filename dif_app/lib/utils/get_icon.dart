// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

IconData getIcon(String categoria) {
  if (categoria == 'EDUCACIÓN') {
    return FontAwesomeIcons.graduationCap;
  }
  if (categoria == 'SALUD') {
    return FontAwesomeIcons.heartbeat;
  }
  if (categoria == 'CAPACITACIÓN MUJER') {
    return FontAwesomeIcons.female;
  }
  if (categoria == 'ADULTO MAYOR') {
    return FontAwesomeIcons.user;
  }
  if (categoria == 'ATENCIÓN JURÍDICA') {
    return FontAwesomeIcons.balanceScale;
  }
  if (categoria == 'ACTIVIDAD FÍSICA') {
    return FontAwesomeIcons.swimmer;
  }
  if (categoria == 'CENTROS') {
    return FontAwesomeIcons.building;
  }
  if (categoria == 'SERVICIOS') {
    return FontAwesomeIcons.handsHelping;
  }
  if (categoria == 'CAPAS') {
    return FontAwesomeIcons.layerGroup;
  }
  return FontAwesomeIcons.rebel;
}

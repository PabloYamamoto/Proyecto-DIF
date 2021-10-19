// ignore_for_file: unused_import, unused_field, unnecessary_this, non_constant_identifier_names, unused_local_variable, avoid_print, avoid_function_literals_in_foreach_calls

import 'package:dif_app/models/models.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ServiciosProvider extends ChangeNotifier {
  final String _baseUrl = 'dif-huixquilucan-app-default-rtdb.firebaseio.com';

  bool cargando = true;
  List<Servicios> listaServicios = [];

  ServiciosProvider() {
    this.cargarServicios();
  }

  cargarServicios() async {
    this.cargando = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'Servicios.json');
    final resp = await http.get(url);

    final List<dynamic> servicios_lista = json.decode(resp.body);

    servicios_lista.forEach((element) {
      final tempServicio = Servicios.fromMap(element);
      this.listaServicios.add(tempServicio);
    });

    this.cargando = false;
    notifyListeners();
    return this.listaServicios;
  }
}

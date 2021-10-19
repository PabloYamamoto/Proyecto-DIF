// ignore_for_file: prefer_const_constructors

import 'package:dif_app/models/models.dart';
import 'package:dif_app/pages/pages.dart';
import 'package:flutter/material.dart';

Route crearRuta(dynamic tipo) {
  return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        if (tipo.runtimeType == Centro) {
          return CentrosDetallesPage();
        }
        return SubServiciosPage();
      },
      transitionDuration: Duration(milliseconds: 350),
      settings: RouteSettings(arguments: tipo),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation =
            CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        return FadeTransition(
            child: child,
            opacity:
                Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation));
      });
}

// ignore_for_file: must_be_immutable, prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, unused_import, override_on_non_overriding_member

import 'package:dif_app/pages/pages.dart';
import 'package:dif_app/providers/provider.dart';
import 'package:dif_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CentrosProvider()),
        ChangeNotifierProvider(create: (_) => ServiciosProvider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DIF HUIXQUILUCAN',
      initialRoute: 'home',
      routes: {
        'home': (_) => ZoomDrawerController(),
        'pagina_principal': (_) => PaginaPrincipalPage(),
        'centros': (_) => CentrosPage(),
        'centros_detalles': (_) => CentrosDetallesPage(),
        'mapas_page': (_) => MapaPage(),
        'servicios': (_) => ServiciosPage(),
        'subservicios_page': (_) => SubServiciosPage(),
        'subservicios_detalles_page': (_) => SubServiciosDetallesPage(),
      },
    );
  }
}

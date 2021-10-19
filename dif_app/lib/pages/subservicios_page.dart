// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, unused_element, prefer_const_constructors, sized_box_for_whitespace, unused_import, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_new, unnecessary_this, prefer_const_constructors_in_immutables, avoid_print, avoid_unnecessary_containers

import 'package:animate_do/animate_do.dart';
import 'package:dif_app/models/models.dart';
import 'package:dif_app/providers/provider.dart';
import 'package:dif_app/utils/utils.dart';
import 'package:dif_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubServiciosPage extends StatelessWidget {
  SubServiciosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Servicios servicio =
        ModalRoute.of(context)!.settings.arguments as Servicios;

    return Scaffold(
        body: Stack(
      children: [
        _Fondo(),
        Positioned(
            top: 0,
            right: 0,
            child: _Header(categoria: servicio.nombreCategora!.toUpperCase())),
        _HomeBody(servicio: servicio),
      ],
    ));
  }
}

class _Fondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(children: [
      Container(decoration: BoxDecoration(color: Colors.white)),
      Positioned(
          right: size.width * 0.70,
          child: FadeInLeftBig(
            duration: Duration(milliseconds: 700),
            child: DecorativoBarraLateral(
                image: AssetImage('assets/triangulos2.png'), lado: 'izquierda'),
          )),
      Positioned(
          top: 50,
          left: 17,
          child: IconButton(
              icon: getIconoRegresar(Colors.white),
              onPressed: () {
                Navigator.pop(context);
              })),
    ]);
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key, required this.categoria}) : super(key: key);

  final String categoria;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SlideInRight(
      duration: Duration(milliseconds: 900),
      child: Stack(
        children: [
          _HeaderFondo(
            size: size,
            categoria: categoria,
          ),
          _HeaderInfo(size: size, categoria: categoria),
        ],
      ),
    );
  }
}

class _HeaderFondo extends StatelessWidget {
  const _HeaderFondo({
    Key? key,
    required this.size,
    required this.categoria,
  }) : super(key: key);

  final Size size;
  final String categoria;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.65,
      height: 170,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colores().getAzul(1), Colores().getAzulClaro(1)]),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: Colors.black45,
              offset: Offset(-4, 5),
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
        child: Stack(
          children: [
            Positioned(
                top: -5,
                right: -80,
                child: FaIcon(getIcon(categoria),
                    size: 200, color: Colors.white.withOpacity(0.2)))
          ],
        ),
      ),
    );
  }
}

class _HeaderInfo extends StatelessWidget {
  const _HeaderInfo({Key? key, required this.size, required this.categoria})
      : super(key: key);

  final Size size;
  final String categoria;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 140, width: 30),
          FaIcon(getIcon(categoria), color: Colors.white, size: 40),
          SizedBox(width: 20),
          Text(categoria.toUpperCase(),
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                        blurRadius: 5,
                        color: Colors.black,
                        offset: Offset(0, 1))
                  ])),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  final Servicios servicio;

  const _HomeBody({Key? key, required this.servicio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      child: Container(
          width: size.width,
          height: size.height * 0.80,
          padding:
              EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 10),
          child: _Tarjetas(servicio: servicio)),
    );
  }
}

class _Tarjetas extends StatelessWidget {
  final Servicios servicio;

  const _Tarjetas({Key? key, required this.servicio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            for (final subserv in servicio.subservicios!)
              GestureDetector(
                  child: FadeInLeftBig(
                    duration: Duration(seconds: 1),
                    child: ListItem(
                      name: subserv.nombreSub!,
                      imageUrl: subserv.urlImagen!,
                      color: Colores().getAzulClaro(1),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      'subservicios_detalles_page',
                      arguments: subserv,
                    );
                  })
          ],
        ));
  }
}

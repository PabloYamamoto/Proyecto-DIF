// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, unused_element, prefer_const_constructors, sized_box_for_whitespace, unused_import, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_new, unnecessary_this, prefer_const_constructors_in_immutables

import 'package:animate_do/animate_do.dart';
import 'package:dif_app/utils/utils.dart';
import 'package:dif_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PaginaPrincipalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Positioned(
            top: 0,
            child: GestureDetector(
              child: FadeInDownBig(
                child: _Caja(titulo: 'CENTROS'),
                duration: Duration(seconds: 1),
              ),
              onTap: () {
                Navigator.pushNamed(context, 'centros');
              },
            )),
        Positioned(
            bottom: 0,
            child: GestureDetector(
                child: FadeInUpBig(
                  child: _Caja(titulo: 'SERVICIOS'),
                  duration: Duration(seconds: 1),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'servicios');
                })),
        Positioned(
            top: size.height * 0.4,
            child: ZoomIn(
              duration: Duration(seconds: 1),
              child: _Logo(),
            ))
      ]),
    );
  }
}

class _Caja extends StatelessWidget {
  final String titulo;

  const _Caja({Key? key, required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height * 0.40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black45,
              )
            ]),
        child: Stack(
          children: [
            _Fondo(titulo),
            _Titulo(titulo),
          ],
        ));
  }
}

class _Fondo extends StatelessWidget {
  final String titulo;

  const _Fondo(this.titulo);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
          width: size.width,
          height: double.infinity,
          //child: Image.asset('assets/triangulos2.png', fit: BoxFit.cover),
          decoration: BoxDecoration(
              gradient: this.titulo == 'CENTROS'
                  ? LinearGradient(
                      colors: [
                        Colores().getAzulClaro(1),
                        Colores().getAzul(1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                  : LinearGradient(
                      colors: [
                        Colores().getAzulClaro(1),
                        Colores().getAzul(1),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    )),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: size.width * 0.2,
                child: FaIcon(
                  getIcon(titulo),
                  color: Colors.white.withOpacity(0.3),
                  size: 250,
                ),
              ),
            ],
          )),
    );
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo(this.titulo);

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Text(titulo.toUpperCase(),
          style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 5,
                  color: Colors.black,
                  offset: Offset(0, 2),
                )
              ])),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.20,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Image.asset('assets/dif-logo.png'),
      ),
    );
  }
}

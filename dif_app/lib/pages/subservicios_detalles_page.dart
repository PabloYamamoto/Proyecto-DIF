// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, unused_element, prefer_const_constructors, sized_box_for_whitespace, unused_import, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_new, unnecessary_this, prefer_const_constructors_in_immutables, avoid_print

import 'package:animate_do/animate_do.dart';
import 'package:dif_app/models/models.dart';
import 'package:dif_app/utils/utils.dart';
import 'package:dif_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SubServiciosDetallesPage extends StatelessWidget {
  const SubServiciosDetallesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Subservicio subserv =
        ModalRoute.of(context)!.settings.arguments as Subservicio;

    return Scaffold(
        body: Stack(
      children: [
        Fondo(),
        CajaSuperior(tipo: subserv),
        _CajaInferior(subserv: subserv),
      ],
    ));
  }
}

class _CajaInferior extends StatelessWidget {
  const _CajaInferior({Key? key, required this.subserv}) : super(key: key);

  final Subservicio subserv;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      child: FadeInUpBig(
        duration: Duration(seconds: 1),
        child: Container(
          width: size.width,
          height: size.height * 0.42,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.black38,
                  offset: Offset(0, -2),
                )
              ]),
          child: Stack(
            children: [
              Column(
                children: [
                  _TituloParteInferior(titulo: 'LOCALIDADES'),
                  _CajaLocalidades(localidades: subserv.localidades!),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _TituloParteInferior extends StatelessWidget {
  const _TituloParteInferior({Key? key, required this.titulo})
      : super(key: key);

  final String titulo;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: EdgeInsets.only(left: 20),
      height: size.height * 0.06,
      alignment: Alignment.centerLeft,
      child: Text(this.titulo,
          style: GoogleFonts.montserrat(
              color: Colores().getAzulClaro(1),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 5,
                  color: Colors.black,
                  offset: Offset(0, 1),
                )
              ])),
    );
  }
}

class _CajaLocalidades extends StatelessWidget {
  const _CajaLocalidades({Key? key, required this.localidades})
      : super(key: key);

  final List<Localidade> localidades;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: size.width,
        padding: EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),
        height: size.height * 0.30,
        decoration: BoxDecoration(
            color: Colores().getAzulClaro(1),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black,
                offset: Offset(0, 2),
              )
            ]),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              for (final localidad in localidades)
                _ListItem(localidad: localidad),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({Key? key, required this.localidad}) : super(key: key);

  final Localidade localidad;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(children: [
        Expanded(
            child: Text(this.localidad.nombrePlantel!.toUpperCase(),
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                      color: Colors.white10,
                      offset: Offset(0, 2),
                    )
                  ],
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ))),
        SizedBox(width: 20),
        Expanded(
            child: Text(this.localidad.direccin!.toUpperCase(),
                textAlign: TextAlign.justify,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 5,
                      color: Colors.black,
                      offset: Offset(0, 2),
                    )
                  ],
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                )))
      ]),
    );
  }
}

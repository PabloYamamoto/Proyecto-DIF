// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, unused_element, prefer_const_constructors, sized_box_for_whitespace, unused_import, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_new, unnecessary_this, prefer_const_constructors_in_immutables, avoid_print

import 'package:animate_do/animate_do.dart';
import 'package:dif_app/models/models.dart';
import 'package:dif_app/utils/utils.dart';
import 'package:dif_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CentrosDetallesPage extends StatelessWidget {
  const CentrosDetallesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Centro centro = ModalRoute.of(context)!.settings.arguments as Centro;

    return Scaffold(
      body: Stack(
        children: [
          Fondo(),
          CajaSuperior(tipo: centro),
          _CajaInferior(centro: centro),
        ],
      ),
    );
  }
}

class _CajaInferior extends StatelessWidget {
  const _CajaInferior({Key? key, required this.centro}) : super(key: key);

  final Centro centro;

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
                  _TituloParteInferior(titulo: 'SERVICIOS'),
                  _CajaServicios(servicios: centro.datos!.servicios!),
                  _TituloParteInferior(titulo: 'INFORMACIÓN'),
                  _CajaInformacion(centro: centro),
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

class _CajaServicios extends StatelessWidget {
  const _CajaServicios({Key? key, required this.servicios}) : super(key: key);

  final List<String> servicios;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: size.width,
        padding: EdgeInsets.only(left: 10, right: 20, top: 10, bottom: 10),
        height: size.height * 0.13,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colores().getAzulClaro(1),
              Colores().getAzulMedio(1),
            ]),
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
              for (final servicio in servicios) _ListItem(servicio: servicio),
            ],
          ),
        ),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({Key? key, required this.servicio}) : super(key: key);

  final String servicio;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(children: [
        Icon(Icons.adjust_sharp, size: 30, color: Colors.white),
        SizedBox(width: 15),
        Expanded(
            child: Text(this.servicio.toUpperCase(),
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

class _CajaInformacion extends StatelessWidget {
  const _CajaInformacion({Key? key, required this.centro}) : super(key: key);

  final Centro centro;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          width: size.width,
          height: size.height * 0.13,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colores().getAzulClaro(1),
                Colores().getAzulMedio(1),
              ]),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  color: Colors.black,
                  offset: Offset(0, 2),
                )
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: size.width * 0.60,
                  height: size.height * 0.3,
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _TituloInformacion(titulo: 'DIRECCIÓN'),
                        _DatoInformacion(
                            info: centro.direccion.toString().toUpperCase()),
                        Divider(
                          color: Colors.white,
                          thickness: 2.0,
                        ),
                        _TituloInformacion(titulo: 'HORARIO DE ATENCIÓN'),
                        _DatoInformacion(
                            info: centro.horarioDeAtencion
                                .toString()
                                .toUpperCase()),
                        Divider(
                          color: Colors.white,
                          thickness: 2.0,
                        ),
                        _TituloInformacion(titulo: 'TELEFONO'),
                        _DatoInformacion(
                            info: centro.telefono.toString().toUpperCase()),
                        Divider(
                          color: Colors.white,
                          thickness: 2.0,
                        ),
                      ],
                    ),
                  )),
              Expanded(
                child: Container(
                    height: size.height,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'mapas_page',
                              arguments: centro);
                        },
                        icon: FaIcon(FontAwesomeIcons.mapMarkerAlt,
                            size: 70, color: Colors.white))),
              )
            ],
          )),
    );
  }
}

class _DatoInformacion extends StatelessWidget {
  const _DatoInformacion({
    Key? key,
    required this.info,
  }) : super(key: key);

  final String info;

  @override
  Widget build(BuildContext context) {
    return Text(this.info,
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
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ));
  }
}

class _TituloInformacion extends StatelessWidget {
  const _TituloInformacion({
    Key? key,
    required this.titulo,
  }) : super(key: key);

  final String titulo;
  @override
  Widget build(BuildContext context) {
    return Text(this.titulo,
        textAlign: TextAlign.start,
        style: GoogleFonts.roboto(
          color: Colors.black,
          // shadows: [
          //   Shadow(
          //     blurRadius: 5,
          //     color: Colors.white,
          //     offset: Offset(0, 2),
          //   )
          // ],
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ));
  }
}

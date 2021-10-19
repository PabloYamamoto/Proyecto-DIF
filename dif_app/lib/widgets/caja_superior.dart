// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, unused_element, prefer_const_constructors, sized_box_for_whitespace, unused_import, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_new, unnecessary_this, prefer_const_constructors_in_immutables, avoid_print
import 'package:animate_do/animate_do.dart';
import 'package:dif_app/models/servicios_modelos.dart';
import 'package:dif_app/utils/utils.dart';
import 'package:dif_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CajaSuperior extends StatelessWidget {
  final dynamic tipo;

  const CajaSuperior({Key? key, required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FadeInDownBig(
      duration: Duration(seconds: 1),
      child: Container(
        width: double.infinity,
        height: size.height * 0.55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5, color: Colors.black38, offset: Offset(0, 2))
            ]),
        child: Stack(
          children: [
            _FondoCaja(image: AssetImage('assets/triangulos2.png')),
            Column(
                children: tipo.runtimeType == Subservicio
                    ? [
                        _Titulo(titulo: tipo.nombreSub!),
                        _Foto(url: tipo.urlImagen!),
                        SizedBox(height: 20),
                        _Descripcion(descripcion: tipo.descripcin!),
                      ]
                    : [
                        _Titulo(titulo: tipo.nombreCentro!),
                        _Foto(url: tipo.urlImagen!),
                        SizedBox(height: 20),
                        _Descripcion(descripcion: tipo.datos!.descripcin!),
                      ])
          ],
        ),
      ),
    );
  }
}

class _Titulo extends StatelessWidget {
  final String titulo;

  const _Titulo({required this.titulo});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(right: 20),
      width: double.infinity,
      height: size.height * 0.165,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 100, width: 10),
          IconButton(
            onPressed: () {
              return Navigator.pop(context);
            },
            icon: getIconoRegresar(Colors.white),
          ),
          SizedBox(height: 100, width: 10),
          Expanded(
            child: Text(
              this.titulo.toUpperCase(),
              style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                        blurRadius: 5,
                        color: Colors.black,
                        offset: Offset(0, 1))
                  ]),
            ),
          )
        ],
      ),
    );
  }

  Color _getColor(String titulo) {
    if (titulo == 'CENTROS') {
      return Colores().getAmarillo(1);
    }
    if (titulo == 'SERVICIOS') {
      return Colores().getAzulClaro(1);
    }
    return Colors.white;
  }
}

class _FondoCaja extends StatelessWidget {
  const _FondoCaja({Key? key, required this.image}) : super(key: key);

  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            child: Image(
              image: this.image,
              fit: BoxFit.cover,
            )));
  }
}

class _Foto extends StatelessWidget {
  _Foto({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5, color: Colors.black, offset: Offset(0, 2))
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                image: NetworkImage(url),
                placeholder: AssetImage('assets/loading.gif'),
                fit: BoxFit.cover),
          )),
    );
  }
}

class _Descripcion extends StatelessWidget {
  const _Descripcion({
    Key? key,
    required this.descripcion,
  }) : super(key: key);

  final String? descripcion;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.11,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  this.descripcion!.toUpperCase(),
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      shadows: [
                        Shadow(
                          blurRadius: 5,
                          color: Colors.black,
                          offset: Offset(0, 1),
                        )
                      ]),
                ),
              ),
            )));
  }
}

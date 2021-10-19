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

class ServiciosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) {
          return ServiciosProvider();
        },
        child: Scaffold(
            body: Stack(
          children: [
            _Fondo(),
            Titulo(titulo: 'SERVICIOS'),
            _HomeBody(),
          ],
        )));
  }
}

class _Fondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(children: [
      Container(decoration: BoxDecoration(color: Colors.white)),
      Positioned(
          left: size.width * 0.79,
          child: Hero(
            tag: 'Dec',
            child: FadeInRightBig(
              duration: Duration(seconds: 1),
              child: DecorativoBarraLateral(
                  image: AssetImage('assets/triangulos2.png'), lado: 'derecha'),
            ),
          ))
    ]);
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final serviciosProvider = Provider.of<ServiciosProvider>(context);

    return Positioned(
      bottom: 0,
      child: Container(
          width: size.width,
          height: size.height * 0.85,
          padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.005, vertical: 10),
          child: serviciosProvider.cargando
              ? Image.asset(
                  'assets/loadingazul.gif',
                  fit: BoxFit.contain,
                )
              : _Tarjetas()),
    );
  }
}

class _Tarjetas extends StatelessWidget {
  const _Tarjetas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final serviciosProvider = Provider.of<ServiciosProvider>(context);

    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            for (final servicio in serviciosProvider.listaServicios)
              GestureDetector(
                  child: FadeInLeftBig(
                    duration: Duration(seconds: 1),
                    child: _Boton(
                      categoria: servicio.nombreCategora!.toUpperCase(),
                      color1: Colores().getAzul(1),
                      color2: Colores().getAzulClaro(1),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      crearRuta(servicio),
                    );
                  })
          ],
        ));
  }
}

class _Boton extends StatelessWidget {
  const _Boton(
      {Key? key,
      required this.categoria,
      required this.color1,
      required this.color2})
      : super(key: key);

  final String categoria;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'SubServ $categoria',
      child: Stack(
        children: [
          _BotonesFondo(color1: color1, color2: color2, categoria: categoria),
          _ContenidoBotones(categoria: categoria),
        ],
      ),
    );
  }
}

class _BotonesFondo extends StatelessWidget {
  const _BotonesFondo({
    Key? key,
    required this.color1,
    required this.color2,
    required this.categoria,
  }) : super(key: key);

  final Color color1;
  final Color color2;
  final String categoria;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.5),
            offset: Offset(0, 6),
          )
        ],
        gradient: LinearGradient(
          colors: [color1, color2],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned(
                top: -5,
                right: -20,
                child: FaIcon(getIcon(categoria),
                    size: 130, color: Colors.white.withOpacity(0.2)))
          ],
        ),
      ),
    );
  }
}

class _ContenidoBotones extends StatelessWidget {
  const _ContenidoBotones({Key? key, required this.categoria})
      : super(key: key);

  final String categoria;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 140, width: 30),
        FaIcon(getIcon(categoria), color: Colors.white, size: 40),
        SizedBox(width: 20),
        Expanded(
          child: Text(categoria.toUpperCase(),
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
        ),
        FaIcon(FontAwesomeIcons.chevronCircleRight,
            color: Colors.white, size: 20),
        SizedBox(width: 40),
      ],
    );
  }
}

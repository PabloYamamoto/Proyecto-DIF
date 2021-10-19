// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, unused_element, prefer_const_constructors, sized_box_for_whitespace, unused_import, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_new, unnecessary_this, prefer_const_constructors_in_immutables

import 'package:animate_do/animate_do.dart';
import 'package:dif_app/models/models.dart';
import 'package:dif_app/pages/pages.dart';
import 'package:dif_app/providers/provider.dart';
import 'package:dif_app/utils/utils.dart';
import 'package:dif_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CentrosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return CentrosProvider();
      },
      child: Scaffold(
        body: Stack(
          children: [
            _Fondo(),
            Titulo(titulo: 'CENTROS'),
            _HomeBody(tipo: 'CENTROS'),
          ],
        ),
      ),
    );
  }
}

class _Fondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(children: [
      Container(decoration: BoxDecoration(color: Colors.white)),
      Positioned(
          left: size.width * 0.75,
          child: FadeInRightBig(
            duration: Duration(seconds: 1),
            child: DecorativoBarraLateral(
                image: AssetImage('assets/triangulos2.png'), lado: 'derecha'),
          ))
    ]);
  }
}

class _HomeBody extends StatelessWidget {
  final dynamic tipo;

  const _HomeBody({Key? key, required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final centrosProvider = Provider.of<CentrosProvider>(context);
    return Positioned(
      bottom: 0,
      child: Container(
          width: size.width,
          height: size.height * 0.80,
          padding:
              EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: 10),
          child: centrosProvider.cargando
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
    final size = MediaQuery.of(context).size;
    final centrosProvider = Provider.of<CentrosProvider>(context);
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            for (final centro in centrosProvider.listaCentros)
              GestureDetector(
                  child: FadeInLeftBig(
                    duration: Duration(seconds: 1),
                    child: ListItem(
                      name: centro.nombreCentro!,
                      imageUrl: centro.urlImagen!,
                      color: Colores().getAzulClaro(1),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      crearRuta(centro),
                    );
                  })
          ],
        ));
  }
}

// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, unused_element, prefer_const_constructors, sized_box_for_whitespace, unused_import, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_new, unnecessary_this, prefer_const_constructors_in_immutables

import 'package:animate_do/animate_do.dart';
import 'package:dif_app/utils/utils.dart';
import 'package:dif_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Titulo extends StatelessWidget {
  final String titulo;

  const Titulo({required this.titulo});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.175,
      padding: EdgeInsets.only(left: 20),
      child: FadeInDownBig(
        duration: Duration(seconds: 1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  return Navigator.pop(context);
                },
                icon: getIconoRegresar(Colores().getAzulClaro(1))),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: size.width * 0.1),
                child: Text(
                  this.titulo,
                  style: GoogleFonts.montserrat(
                      color: _getColor(titulo),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                            blurRadius: 5,
                            color: Colors.black,
                            offset: Offset(0, 1))
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Color _getColor(String titulo) {
    if (titulo == 'CENTROS') {
      return Colores().getAzulClaro(1);
    }
    if (titulo == 'SERVICIOS') {
      return Colores().getAzulClaro(1);
    }
    return Colors.white;
  }
}

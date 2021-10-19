// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, unused_element, prefer_const_constructors, sized_box_for_whitespace, unused_import, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_new, unnecessary_this, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class DecorativoBarraLateral extends StatelessWidget {
  final AssetImage image;
  final String lado;

  const DecorativoBarraLateral(
      {Key? key, required this.image, required this.lado});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1.2,
      width: 236,
      decoration: BoxDecoration(boxShadow: [
        this.lado == 'derecha'
            ? BoxShadow(
                blurRadius: 5,
                color: Colors.black38,
                offset: Offset(-5, 2),
              )
            : BoxShadow(
                blurRadius: 5,
                color: Colors.black38,
                offset: Offset(5, 2),
              )
      ], borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image(image: this.image, fit: BoxFit.cover)),
    );
  }
}


// Para Colocar el decorativo dentro de un stack : 
// Positioned(
//               left: MediaQuery.of(context).size.width * 0.8,
//               top: MediaQuery.of(context).size.height * 0.1,


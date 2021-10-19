// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, unused_element, prefer_const_constructors, sized_box_for_whitespace, unused_import, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_new, unnecessary_this, prefer_const_constructors_in_immutables, curly_braces_in_flow_control_structures, avoid_print

import 'package:animate_do/animate_do.dart';
import 'package:dif_app/models/models.dart';
import 'package:dif_app/providers/provider.dart';
import 'package:dif_app/utils/utils.dart';
import 'package:dif_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final Color color;

  const ListItem(
      {Key? key,
      required this.name,
      required this.imageUrl,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            _background(context),
            _opacidadImagen(),
            _titulo(context, color),
          ],
        ),
      ),
    );
  }

  Widget _background(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
    );
  }

  Widget _opacidadImagen() {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.55),
        ),
      ),
    );
  }

  Widget _titulo(BuildContext context, Color color) {
    return Positioned(
      left: 10,
      bottom: 0,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.72,
          padding: EdgeInsets.only(bottom: 20),
          height: 90,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FittedBox(
                  child: Text(
                    name.toUpperCase(),
                    style: GoogleFonts.montserrat(
                        color: color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 5,
                            color: Colors.black,
                            offset: Offset(0, 2),
                          )
                        ]),
                  ),
                ),
                SizedBox(height: 2),
              ]),
        ),
      ),
    );
  }
}

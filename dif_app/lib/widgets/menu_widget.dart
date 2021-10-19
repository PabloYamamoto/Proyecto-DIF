// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, unused_element, prefer_const_constructors, sized_box_for_whitespace, unused_import, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_new, unnecessary_this, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class MenuWidget extends StatelessWidget {
  final Color color;

  const MenuWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButtonSolution(color: color);
  }
}

class IconButtonSolution extends StatelessWidget {
  const IconButtonSolution({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          ZoomDrawer.of(context)!.toggle();
        },
        icon: Icon(
          Icons.menu,
          color: this.color,
          size: 30,
        ));
  }
}

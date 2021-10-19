// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, unused_element, prefer_const_constructors, sized_box_for_whitespace, unused_import, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_new, unnecessary_this, prefer_const_constructors_in_immutables

import 'package:dif_app/utils/utils.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const MenuPage(
      {Key? key, required this.currentItem, required this.onSelectedItem});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colores().getNaranja(1),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 2),
            ...MenuItems.all.map(buildMenuItem).toList(),
            Spacer(
              flex: 2,
            ),
          ],
        )),
      ),
    );
  }

  buildMenuItem(MenuItem e) {
    return ListTileTheme(
      selectedColor: Colors.white,
      child: ListTile(
        selected: currentItem == e,
        selectedTileColor: Colores().getAzul(1),
        minLeadingWidth: 20,
        leading: Icon(e.icon),
        title: Text(e.title),
        onTap: () {
          onSelectedItem(e);
        },
      ),
    );
  }
}

class MenuItems {
  static const home = MenuItem('PÁPGINA PRINCIPAL', Icons.home);
  static const centros = MenuItem('CENTROS', Icons.apartment_sharp);
  static const servicios = MenuItem('SERVICIOS', Icons.supervised_user_circle);

  static const all = [home, centros, servicios];
}

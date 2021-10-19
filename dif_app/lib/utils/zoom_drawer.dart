// ignore_for_file: must_be_immutable, prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, unused_import, override_on_non_overriding_member, unnecessary_null_in_if_null_operators

import 'package:dif_app/pages/pages.dart';
import 'package:dif_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class ZoomDrawerController extends StatefulWidget {
  @override
  State<ZoomDrawerController> createState() => _ZoomDrawerControllerState();
}

class _ZoomDrawerControllerState extends State<ZoomDrawerController> {
  MenuItem currentItem = MenuItems.home;
  //final ZoomDrawerController _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      //controller: _drawerController,
      menuScreen: Builder(
        builder: (context) => MenuPage(
            currentItem: currentItem,
            onSelectedItem: (item) {
              setState(() {
                currentItem = item;
              });
              ZoomDrawer.of(context)!.close();
            }),
      ),
      mainScreen: getScreen(),
      angle: 0,
      style: DrawerStyle.Style1,
      borderRadius: 20,
      slideWidth: MediaQuery.of(context).size.width * 0.8,
    );
  }

  getScreen() {
    switch (currentItem) {
      case MenuItems.centros:
        return CentrosPage();
      case MenuItems.servicios:
        return ServiciosPage();
      case MenuItems.home:
        return PaginaPrincipalPage();
    }
  }
}

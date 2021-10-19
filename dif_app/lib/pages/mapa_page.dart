// ignore_for_file: use_key_in_widget_constructors, non_constant_identifier_names, unused_element, prefer_const_constructors, sized_box_for_whitespace, unused_import, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_new, unnecessary_this, prefer_const_constructors_in_immutables, avoid_print, unused_field, prefer_final_fields, prefer_collection_literals

import 'dart:async';

import 'package:dif_app/models/models.dart';
import 'package:dif_app/utils/utils.dart';
import 'package:dif_app/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final Centro centro = ModalRoute.of(context)?.settings.arguments as Centro;

    final CameraPosition _puntoInicial = CameraPosition(
      target: LatLng(centro.lat!.toDouble(), centro.long!.toDouble()),
      zoom: 16,
      tilt: 70,
    );

    String checkMapType() {
      if (mapType == MapType.normal) {
        return 'Normal';
      } else if (mapType == MapType.satellite) {
        return 'Satelite';
      } else if (mapType == MapType.terrain) {
        return 'Terreno';
      } else {
        return 'Hibrido';
      }
    }

    String tipo = checkMapType();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              return Navigator.pop(context);
            },
            icon: getIconoRegresar(Colors.white)),
        backgroundColor: Colores().getAzulClaro(1),
        title: Column(
          children: [
            FittedBox(
              child: Text(
                centro.nombreCentro!.toUpperCase(),
                style: GoogleFonts.montserrat(
                    color: Colors.white,
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
            SizedBox(
              height: 5,
            ),
            FittedBox(
              child: Text(
                tipo.toUpperCase(),
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          blurRadius: 5,
                          color: Colors.black,
                          offset: Offset(0, 1))
                    ]),
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: LatLng(
                            centro.lat!.toDouble(), centro.long!.toDouble()),
                        zoom: 17.5,
                        tilt: 60)));
              },
              icon: Icon(Icons.location_on, color: Colors.white))
        ],
      ),
      body: GoogleMap(
        mapType: mapType,
        myLocationButtonEnabled: false,
        initialCameraPosition: _puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _getMarkers(centro),
      ),
      floatingActionButton: FloatingActionButton(
        child: FaIcon(getIcon('CAPAS')),
        onPressed: () {
          if (mapType == MapType.normal) {
            mapType = MapType.satellite;
          } else if (mapType == MapType.satellite) {
            mapType = MapType.hybrid;
          } else if (mapType == MapType.hybrid) {
            mapType = MapType.terrain;
          } else {
            mapType = MapType.normal;
          }

          setState(() {});
        },
      ),
    );
  }

  _getMarkers(Centro centro) {
    var tmp = Set<Marker>();

    tmp.add(Marker(
      markerId: MarkerId(centro.nombreCentro!),
      alpha: 1,
      position: LatLng(centro.lat!.toDouble(), centro.long!.toDouble()),
      visible: true,
      infoWindow: InfoWindow(
          title: centro.direccion!.toUpperCase(),
          snippet: centro.horarioDeAtencion!.toUpperCase()),
    ));

    return tmp;
  }
}

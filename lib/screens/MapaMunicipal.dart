import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:davidzonecidadao/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaMunicipal extends StatefulWidget {
  @override
  _MapaMunicipal createState() {
    return new _MapaMunicipal();
  }
}

class _MapaMunicipal extends State<MapaMunicipal> {
  late GoogleMapController mapController;
  List<Marker> markers = [];
  List<Polygon> polygons = [];
  final LatLng _center = const LatLng(-22.906546036007246, -47.04614884200783);

  // MapaMunicipal({Key? key}) : super(key: key);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    initilize();
    super.initState();
  }

  initilize() {
    int i = 0;
    Marker firstMarker = Marker(
      markerId: MarkerId('davidgas'),
      position: LatLng(-22.922795035713108, -47.0600505551868),
      infoWindow: InfoWindow(
          title: 'Posto DavidGas',
          snippet: 'Comprar ticket em dinheiro em horário comercial'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueCyan,
      ),
    );
    Marker secoundMarker = Marker(
      markerId: MarkerId('daviduniversity'),
      position: LatLng(-22.83434768818629, -47.05089004881388),
      infoWindow: InfoWindow(
          title: 'David University of Campinas',
          snippet: 'Comprar ticket em dinheiro em horário comercial'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueCyan,
      ),
    );
    Marker thirdMarker = Marker(
      markerId: MarkerId('davidbread'),
      position: LatLng(-22.9260127049913, -47.07022138755717),
      infoWindow: InfoWindow(
          title: 'Padaria DavidBread',
          snippet: 'Comprar ticket em dinheiro em horário comercial'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueCyan,
      ),
    );

    Polygon firstPolygon = Polygon(
        polygonId: PolygonId((i++).toString()),
        fillColor: Colors.white10,
        strokeColor: Colors.blueAccent,
        points: const <LatLng>[
          LatLng(-22.922206, -47.061282),
          LatLng(-22.924138, -47.061515),
          LatLng(-22.924362, -47.058423),
          LatLng(-22.922571, -47.058265),
        ]);
    Polygon secoundPolygon = Polygon(
        polygonId: PolygonId((i++).toString()),
        fillColor: Colors.white10,
        strokeColor: Colors.blueAccent,
        points: const <LatLng>[
          LatLng(-22.8320573, -47.05358),
          LatLng(-22.8364163, -47.0528129),
          LatLng(-22.8366351, -47.0488115),
          LatLng(-22.8315469, -47.0497846),
        ]);
    Polygon thirdPolygon = Polygon(
        polygonId: PolygonId((i++).toString()),
        fillColor: Colors.white10,
        strokeColor: Colors.blueAccent,
        points: const <LatLng>[
          LatLng(-22.927801, -47.070698),
          LatLng(-22.926371, -47.071941),
          LatLng(-22.925160, -47.070100),
          LatLng(-22.925825, -47.069456),
        ]);
    markers.add(firstMarker);
    markers.add(secoundMarker);
    markers.add(thirdMarker);

    polygons.add(firstPolygon);
    polygons.add(secoundPolygon);
    polygons.add(thirdPolygon);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: CustomAppBar(),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.7,
        ),
        markers: markers.map((e) => e).toSet(),
        polygons: polygons.map((e) => e).toSet(),
      ),
    );
  }
}

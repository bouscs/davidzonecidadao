import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:davidzonecidadao/main.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapaMunicipal extends StatefulWidget {
  @override
  _MapaMunicipal createState() {
    return new _MapaMunicipal();
  }
}

class _MapaMunicipal extends State<MapaMunicipal> {
  List<Marker> markers = [];
  List<Polygon> polygons = [];

  LatLng _initialcameraposition =
      LatLng(-22.906546036007246, -47.04614884200783);
  late GoogleMapController _controller;
  // MapaMunicipal({Key? key}) : super(key: key);

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    changeMapMode();
  }

  changeMapMode() {
    getJsonFile("assets/mapstyle.json").then(setMapStyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  @override
  void initState() {
    initilize();
    super.initState();
  }

  initilize() {
    int i = 0;
    Marker oneMarker = Marker(
      markerId: MarkerId('davidgas'),
      position: LatLng(-22.922795035713108, -47.0600505551868),
      infoWindow: InfoWindow(
          title: 'Posto DavidGas',
          snippet: 'Comprar ticket em dinheiro em horário comercial'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );
    Marker twoMarker = Marker(
      markerId: MarkerId('daviduniversity'),
      position: LatLng(-22.83434768818629, -47.05089004881388),
      infoWindow: InfoWindow(
          title: 'David University of Campinas',
          snippet: 'Comprar ticket em dinheiro em horário comercial'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );
    Marker threeMarker = Marker(
      markerId: MarkerId('davidbread'),
      position: LatLng(-22.9260127049913, -47.07022138755717),
      infoWindow: InfoWindow(
          title: 'Padaria DavidBread',
          snippet: 'Comprar ticket em dinheiro em horário comercial'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );
    Marker fourMarker = Marker(
      markerId: MarkerId('davidcenter'),
      position: LatLng(-22.8952342, -47.0632546),
      infoWindow: InfoWindow(
          title: 'Shopping David Center',
          snippet: 'Comprar ticket em dinheiro em horário comercial'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );
    Marker fiveMarker = Marker(
      markerId: MarkerId('david gym'),
      position: LatLng(-22.894672, -47.057845),
      infoWindow: InfoWindow(
          title: 'David Gym',
          snippet: 'Comprar ticket em dinheiro em horário comercial'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );
    Marker sixMarker = Marker(
      markerId: MarkerId('davidramen'),
      position: LatLng(-22.8925034, -47.0540452),
      infoWindow: InfoWindow(
          title: 'Restaurante David Ramen',
          snippet: 'Comprar ticket em dinheiro em horário comercial'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueRed,
      ),
    );

    Polygon onePolygon = Polygon(
        polygonId: PolygonId((i++).toString()),
        fillColor: Colors.blueAccent.withOpacity(0.3),
        strokeColor: Colors.blueAccent,
        strokeWidth: 3,
        points: const <LatLng>[
          LatLng(-22.922206, -47.061282),
          LatLng(-22.924138, -47.061515),
          LatLng(-22.924362, -47.058423),
          LatLng(-22.922571, -47.058265),
        ]);
    Polygon twoPolygon = Polygon(
        polygonId: PolygonId((i++).toString()),
        fillColor: Colors.blueAccent.withOpacity(0.3),
        strokeColor: Colors.blueAccent,
        strokeWidth: 3,
        points: const <LatLng>[
          LatLng(-22.8320573, -47.05358),
          LatLng(-22.8364163, -47.0528129),
          LatLng(-22.8366351, -47.0488115),
          LatLng(-22.8315469, -47.0497846),
        ]);
    Polygon threePolygon = Polygon(
        polygonId: PolygonId((i++).toString()),
        fillColor: Colors.blueAccent.withOpacity(0.3),
        strokeColor: Colors.blueAccent,
        strokeWidth: 3,
        points: const <LatLng>[
          LatLng(-22.927801, -47.070698),
          LatLng(-22.926371, -47.071941),
          LatLng(-22.925160, -47.070100),
          LatLng(-22.925825, -47.069456),
        ]);
    Polygon fourPolygon = Polygon(
        polygonId: PolygonId((i++).toString()),
        fillColor: Colors.blueAccent.withOpacity(0.3),
        strokeColor: Colors.blueAccent,
        strokeWidth: 3,
        points: const <LatLng>[
          LatLng(-22.894855, -47.066085),
          LatLng(-22.893027, -47.064482),
          LatLng(-22.895093, -47.061600),
          LatLng(-22.897310,
              -47.062624), // (in case shit happens: -22.896965, -47.063159)
        ]);
    Polygon fivePolygon = Polygon(
        polygonId: PolygonId((i++).toString()),
        fillColor: Colors.blueAccent.withOpacity(0.3),
        strokeColor: Colors.blueAccent,
        strokeWidth: 3,
        points: const <LatLng>[
          LatLng(-22.893803, -47.060337),
          LatLng(-22.895374, -47.059413),
          LatLng(-22.895990, -47.056971),
          LatLng(-22.894877, -47.054850),
        ]);
    Polygon sixPolygon = Polygon(
        polygonId: PolygonId((i++).toString()),
        fillColor: Colors.blueAccent.withOpacity(0.3),
        strokeColor: Colors.blueAccent,
        strokeWidth: 3,
        points: const <LatLng>[
          LatLng(-22.891657, -47.055455),
          LatLng(-22.893112, -47.055586),
          LatLng(-22.893601, -47.049526),
          LatLng(-22.891987, -47.048232),
        ]);

    markers.add(oneMarker);
    markers.add(twoMarker);
    markers.add(threeMarker);
    markers.add(fourMarker);
    markers.add(fiveMarker);
    markers.add(sixMarker);

    polygons.add(onePolygon);
    polygons.add(twoPolygon);
    polygons.add(threePolygon);
    polygons.add(fourPolygon);
    polygons.add(fivePolygon);
    polygons.add(sixPolygon);

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
        myLocationEnabled: true,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _initialcameraposition,
          zoom: 12,
        ),
        markers: markers.map((e) => e).toSet(),
        polygons: polygons.map((e) => e).toSet(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fillme/fillingStationModel.dart';

void main() => runApp(MyMapApp());

class MyMapApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyMapHome(),
    );
  }
}

class MyMapHome extends StatefulWidget {
  _MyMapHomeState createState() => _MyMapHomeState();
}

class _MyMapHomeState extends State<MyMapHome> {
  GoogleMapController _controller;

  //Create the list of markers
  List<Marker> allMarkers = [];
  @override
  void initState() {
    super.initState();
    fillingStations.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.stationName),
          draggable: false,
          infoWindow:
              InfoWindow(title: element.stationName, snippet: element.address),
          position: element.locationCodes));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Nearest Filling Stations"),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: LatLng(6.9147, 79.9733), zoom: 13.5),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
              ),
            ),
          ],
        ));
  }

  void mapCreated(controller) {
    setState() {
      _controller = controller;
    }
  }
}

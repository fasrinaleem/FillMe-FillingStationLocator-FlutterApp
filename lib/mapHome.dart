import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fillme/fillingStationModel.dart';
import 'navigation/navigation_bloc.dart';

class MyMapApp extends StatelessWidget with NavigationStates {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyMapHome(),
    );
  }
}

// Creating the Stateful widget to the MyMapHome class
class MyMapHome extends StatefulWidget {
  _MyMapHomeState createState() => _MyMapHomeState();
}

// Creating MyMapHome state
class _MyMapHomeState extends State<MyMapHome> {
  GoogleMapController _controller;

  //Create the list of markers
  List<Marker> allMarkers = [];

  //Controller for sliding view
  PageController _pageController;

  int prevPage;

// Difining the initial state appearences
  @override
  void initState() {
    super.initState();
    //Adding a marker for each filling station models which were
    // difine in the FillingStationModel.dart file
    fillingStations.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element
              .stationName), //Setting the marker id as filling station name in Filling tation model
          draggable: false,
          infoWindow: InfoWindow(
              title: element.stationName,
              snippet:
                  element.address), //Showing the modal info window in the app
          position: element
              .locationCodes)); // Set the position as langitute and lattitude values in Filling Station model
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(
          _onScroll); // Adding a lister function when scrolling the info modal
  }

// Moving the camera position into particular place (particular filling station) when scrolling
  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

// Bringin the card on top of the map
  _fillingStationList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
          child: Stack(children: [
        Center(
            child: Container(
                // Setting the margin of container
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                // Setting the heigh and width of container
                height: 125.0,
                width: 275.0,
                decoration: BoxDecoration(
                    // Setting the modal box as radius circular one
                    borderRadius: BorderRadius.circular(10.0),
                    // Set some shadow off set value
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 10.0,
                      ),
                    ]),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white),
                    // Getting the image link from the FillingStationModel(then load) and showing inside the info modal
                    child: Row(children: [
                      Container(
                          height: 90.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      fillingStations[index].image),
                                  fit: BoxFit.cover))),
                      SizedBox(width: 5.0),
                      // Showing the filling station name, address and description in info modal
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fillingStations[index].stationName,
                              style: TextStyle(
                                  fontSize: 12.5, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              fillingStations[index].address,
                              style: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              width: 170.0,
                              child: Text(
                                fillingStations[index].description,
                                style: TextStyle(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            )
                          ])
                    ]))))
      ])),
    );
  }

// Bringing the google map inside the application
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
              // Set the initial latitude and langitude values (default camera position)
              child: GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: LatLng(6.9147, 79.9733), zoom: 12),
                markers: Set.from(
                    allMarkers), // Setting the google map markers as above defined list (array)
                onMapCreated: mapCreated,
              ),
            ),
            Positioned(
                bottom: 20.0,
                child: Container(
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: fillingStations.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _fillingStationList(index);
                      },
                    )))
          ],
        ));
  }

// Set the GoogleMapController state as _controller
  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

// Difining the move camera function
// Move the camera position into particular filling station langitute and longitude values when modal is scrolling
  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: fillingStations[_pageController.page.toInt()].locationCodes,
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }
}

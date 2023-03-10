import 'package:easyparking/pages/navigation/blocs/application_bloc.dart';
import 'package:easyparking/pages/navigation/models/place.dart';
import 'package:easyparking/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';



class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key : key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  Completer<GoogleMapController> _mapController = Completer();
  StreamSubscription? locationSubscription;
  StreamSubscription? boundsSubscription;
  final _locationController = TextEditingController();




  @override
  void initState() {
    // TODO: implement initState
    final applicationBloc = Provider.of<ApplicationBloc>(context, listen: false);

    //Listen for selected Location
    locationSubscription = applicationBloc.selectedLocation.stream.listen((place) {
      if (place != null) {
        _locationController.text = place.name;
        _goToPlace(place);
      } else
        _locationController.text = "";
    });

    applicationBloc.bounds.stream.listen((bounds) async {
      final GoogleMapController controller = await _mapController.future;
      controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    });


    super.initState();
  }

    @override
  void dispose() {
    final applicationBloc =
        Provider.of<ApplicationBloc>(context, listen: false);
    applicationBloc.dispose();
    _locationController.dispose();
    locationSubscription?.cancel();
    boundsSubscription?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);

    return Scaffold(
      body:(applicationBloc.currentLocation == null) 
          ? const Center(
              child: CircularProgressIndicator(),
              )
      : ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        hintText: 'Search by City',
                        suffixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) => applicationBloc.searchPlaces(value),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 500.0,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                                applicationBloc.currentLocation?.latitude ?? 0.0,
                                applicationBloc.currentLocation?.longitude ?? 0.0),
                            zoom: 14,
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            _mapController.complete(controller);
                          },
                          // markers: Set<Marker>.of(applicationBloc.markers),
                            markers: Set<Marker>.of([
                                    Marker(
                                      markerId: MarkerId('parking1'),
                                      position: LatLng(3.0738, 101.5183),
                                      infoWindow: InfoWindow(title: 'Arena MBSJ'),
                                      onTap: () => Get.toNamed(RouteHelper.getInMarkParkingPage()),
                                    ),

                                    Marker(
                                      markerId: MarkerId('parking2'),
                                      position: LatLng(3.0400342456486484, 101.57986118588914),
                                      infoWindow: InfoWindow(title: 'Arena MBSJ'),
                                      onTap: () => Get.toNamed(RouteHelper.getInMarkParkingPage()),

                                    ),

                                    Marker(
                                      markerId: MarkerId('parking3'),
                                      position: LatLng(3.041470810386873, 101.58054291955547),
                                      infoWindow: InfoWindow(title: 'Arena MBSJ'),
                                      onTap: () => Get.toNamed(RouteHelper.getInMarkParkingPage()),

                                    ),

                                    Marker(
                                      markerId: MarkerId('parking4'),
                                      position: LatLng(3.0487989720873734, 101.5777534221093),
                                      infoWindow: InfoWindow(title: 'Arena MBSJ'),
                                      onTap: () => Get.toNamed(RouteHelper.getInMarkParkingPage()),

                                    ),

                                    Marker(
                                      markerId: MarkerId('parking5'),
                                      position: LatLng(3.0546057548451553, 101.59468352583382),
                                      infoWindow: InfoWindow(title: 'Arena MBSJ'),
                                      onTap: () => Get.toNamed(RouteHelper.getInMarkParkingPage()),

                                    ),


                                    Marker(
                                      markerId: MarkerId('parking6'),
                                      position: LatLng(3.053962939111916, 101.57871901737263),
                                      infoWindow: InfoWindow(title: 'Arena MBSJ'),
                                      onTap: () => Get.toNamed(RouteHelper.getInMarkParkingPage()),

                                    ),


                                    Marker(
                                      markerId: MarkerId('parking7'),
                                      position: LatLng(3.046270547674886, 101.57968461264247),
                                      infoWindow: InfoWindow(title: 'Arena MBSJ'),
                                      onTap: () => Get.toNamed(RouteHelper.getInMarkParkingPage()),

                                    ),


                                    Marker(
                                      markerId: MarkerId('parking8'),
                                      position: LatLng(3.0444063665408168, 101.59706532749938),
                                      infoWindow: InfoWindow(title: 'Arena MBSJ'),
                                      onTap: () => Get.toNamed(RouteHelper.getInMarkParkingPage()),

                                    ),


                                    Marker(
                                      markerId: MarkerId('parking9'),
                                      position: LatLng(3.0412779633666167, 101.59258067391285),
                                      infoWindow: InfoWindow(title: 'Arena MBSJ'),
                                      onTap: () => Get.toNamed(RouteHelper.getInMarkParkingPage()),

                                    ),


                                    Marker(
                                      markerId: MarkerId('parking10'),
                                      position: LatLng(3.0663729271715154, 101.58763874767999),
                                      infoWindow: InfoWindow(title: 'Arena MBSJ'),
                                      onTap: () => Get.toNamed(RouteHelper.getInMarkParkingPage()),

                                    ),


                                    Marker(
                                      markerId: MarkerId('parking11'),
                                      position: LatLng(3.0400342456486484, 101.57986118588914),
                                      infoWindow: InfoWindow(title: 'Arena MBSJ'),
                                      onTap: () => Get.toNamed(RouteHelper.getInMarkParkingPage()),

                                    ),

                                    Marker(
                                      markerId: MarkerId('parking12'),
                                      position: LatLng(3.0686192357061466, 101.57849311023784),
                                      infoWindow: InfoWindow(title: 'Arena MBSJ'),
                                      onTap: () => Get.toNamed(RouteHelper.getInMarkParkingPage()),

                                    ),

                                    Marker(
                                      markerId: MarkerId('parking13'),
                                      position: LatLng(3.064458037482437, 101.60460243003234),
                                      infoWindow: InfoWindow(title: 'Arena MBSJ'),
                                      onTap: () => Get.toNamed(RouteHelper.getInMarkParkingPage()),

                                    ),

                                    Marker(
                                      markerId: MarkerId('parking14'),
                                      position: LatLng(3.070718241053567, 101.60297981693778),
                                      infoWindow: InfoWindow(title: 'Arena MBSJ'),
                                      onTap: () => Get.toNamed(RouteHelper.getInMarkParkingPage()),

                                    ),

                                    Marker(
                                      markerId: MarkerId('parking15'),
                                      position: LatLng(3.0731, 101.6071),
                                      infoWindow: InfoWindow(title: 'Parking 2'),
                                      onTap: () => Get.toNamed(RouteHelper.getInMarkParkingPage()),

                                    ),
                                  ]),


                        ),
                      ),
                      if (applicationBloc.searchResults != null &&
                          applicationBloc.searchResults.length != 0)
                        Container(
                            height: 200.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.6),
                                backgroundBlendMode: BlendMode.darken)
                                ),
                      if (applicationBloc.searchResults != null)
                        Container(
                          height: 200.0,
                          child: ListView.builder(
                              itemCount: applicationBloc.searchResults.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    applicationBloc
                                        .searchResults[index].description,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    applicationBloc.setSelectedLocation(
                                        applicationBloc
                                            .searchResults[index].placeId);
                                  },
                                );
                              }),
                        ),
                    ],   
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Find Nearest',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold)),
                  ),
                  Wrap(
                      spacing: 8.0,
                      children: [
                        FilterChip(
                          label: Text('Campground'),
                          onSelected: (val) => applicationBloc.togglePlaceType('campground', val),
                          selected: applicationBloc.placeType  == 'campground',
                          selectedColor: Colors.blue,
                        ),

                         FilterChip(
                          label: Text('Parking'),
                          onSelected: (val) {
                            print(val.toString());
                            return applicationBloc.togglePlaceType('parking', val);
                          },
                          selected: applicationBloc.placeType  == 'parking',
                          selectedColor: Colors.blue,
                        ),
                      ]
                  ),
                  
                ]
              ),
    
    );
  }

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
                place.geometry.location.lat, place.geometry.location.lng),
            zoom: 14.0),
      ),
    );
  }
}
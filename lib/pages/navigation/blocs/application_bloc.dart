import 'dart:async';

import 'package:easyparking/pages/navigation/models/geometry.dart';
import 'package:easyparking/pages/navigation/models/location.dart';
import 'package:easyparking/pages/navigation/models/place.dart';
import 'package:easyparking/pages/navigation/models/place_search.dart';
import 'package:easyparking/pages/navigation/services/geolocator_service.dart';
import 'package:easyparking/pages/navigation/services/marker_service.dart';
import 'package:easyparking/pages/navigation/services/places_service.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApplicationBloc with ChangeNotifier {
  final geoLocatorService = GeolocatorService();
  final placesService = PlacesService();
  final markerService = MarkerService();


  
  //Variable
  Position? currentLocation;
  List<PlaceSearch> searchResults = [];
  StreamController<Place> selectedLocation = StreamController<Place>();
  StreamController<LatLngBounds> bounds = StreamController<LatLngBounds>();
  Place? selectedLocationStatic;
  String placeType = "";
  List<Place> placeResults = [];
  List<Marker> markers = <Marker>[];



  ApplicationBloc() {
    _init();
  }
  
  // get markerService => null;

  Future<void> _init() async {
    await setCurrentLocation();
  }

  Future<void> setCurrentLocation() async {
    currentLocation = await geoLocatorService.getCurrentLocation();
    selectedLocationStatic = Place(
        name: "",
        geometry: Geometry(
          location: Location(
            lat: currentLocation?.latitude ?? 0.0,
            lng: currentLocation?.longitude ?? 0.0,
          ),
        ),
        vicinity: "",
      );
    notifyListeners();
  }

  
  searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    notifyListeners();
  }

  
  setSelectedLocation(String placeId) async {
    var sLocation = await placesService.getPlace(placeId);
    selectedLocation.add(sLocation);
    selectedLocationStatic = sLocation;
    searchResults = [];
    notifyListeners();
  }

  togglePlaceType(String value, bool selected) async {
    if (selected) {
      placeType = value;
      print("placeType: " + placeType);
    } else {
      placeType = "";
    }

    if (placeType != "") {
      var places = await placesService.getPlaces(
          selectedLocationStatic!.geometry.location.lat,
          selectedLocationStatic!.geometry.location.lng, placeType);
      print("Length: " + places.toString());
      markers= [];
      if (places.length > 0) {
        var newMarker = markerService.createMarkerFromPlace(places[0],false);
        markers.add(newMarker);
      }

      var locationMarker = markerService.createMarkerFromPlace(selectedLocationStatic!,true);
      markers.add(locationMarker);

      var _bounds = markerService.bounds(Set<Marker>.of(markers));
      bounds.add(_bounds!);

      notifyListeners();
    } else {
      print("Length: 0");
    }
  }



@override
void dispose() {
  selectedLocation.close();
  bounds.close();
  super.dispose();
  }

}

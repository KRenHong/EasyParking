import 'dart:async';

import 'package:easyparking/pages/navigation/models/place_search.dart';
import 'package:easyparking/pages/navigation/services/geolocator_service.dart';
import 'package:easyparking/pages/navigation/services/places_service.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApplicationBloc with ChangeNotifier {
  final geoLocatorService = GeolocatorService();
  final placesService = PlacesService();

  
  //Variable
  Position currentLocation = Position(longitude: 0, latitude:  0, timestamp: DateTime.now(), accuracy: 0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0);
  List<PlaceSearch> searchResults = [];


  ApplicationBloc() {
    _init();
  }

  Future<void> _init() async {
    await setCurrentLocation();
  }

  Future<void> setCurrentLocation() async {
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }

  
  searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    notifyListeners();
  }
}

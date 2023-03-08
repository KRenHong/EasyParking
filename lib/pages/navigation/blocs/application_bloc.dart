import 'dart:async';

import 'package:easyparking/pages/navigation/services/geolocator_service.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ApplicationBloc with ChangeNotifier {
  final geoLocatorService = GeolocatorService();
  
  ApplicationBloc() {
    setCurrentLocation();
  }

  //Variables
  late Position currentLocation;


  setCurrentLocation() async {
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }
}

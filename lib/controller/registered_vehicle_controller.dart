import 'package:easyparking/controller/add_vehicle_controller.dart';
import 'package:easyparking/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/vehicle.dart';

class RegisteredVehicleController extends GetxController implements GetxService{
  final SharedPreferences sharedPreferences;

  RegisteredVehicleController({
    required this.sharedPreferences
  });

  List<Vehicle> getVehicleList() {
    String listString = sharedPreferences.getString(AppConstant.VEHICLE)?? "";
    List<Vehicle> list = [];
    if(!listString.isEmpty) {
      list = Vehicle.decode(listString);
    }
    return list;
  }

  void removeVehicle(Vehicle vehicle) {
    List<Vehicle> list = getVehicleList();
    list.removeWhere((item) => item.carPlate == vehicle.carPlate);
    sharedPreferences.setString(AppConstant.VEHICLE, Vehicle.encode(list));
    update();
  }
}
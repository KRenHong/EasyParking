import 'package:easyparking/controller/profile/registered_vehicle_controller.dart';
import 'package:easyparking/models/vehicle.dart';
import 'package:easyparking/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddVehicleController extends GetxController implements GetxService{
  final SharedPreferences sharedPreferences;
  AddVehicleController({
    required this.sharedPreferences
  });

  List<Vehicle> vehicleList = Get.find<RegisteredVehicleController>().getVehicleList();

  void addVehicle(Vehicle vehicle) {
    vehicleList.add(vehicle);
    sharedPreferences.setString(AppConstant.VEHICLE, Vehicle.encode(vehicleList));
    print("Added");
    update();
  }

}
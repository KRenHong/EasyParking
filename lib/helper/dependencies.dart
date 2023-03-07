import 'package:easyparking/controller/add_vehicle_controller.dart';
import 'package:easyparking/controller/registered_vehicle_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //Registered vehicle controller
  Get.lazyPut(() => RegisteredVehicleController(sharedPreferences: Get.find()));

  //Add vehicle controller
  Get.lazyPut(() => AddVehicleController(sharedPreferences: Get.find()));
}
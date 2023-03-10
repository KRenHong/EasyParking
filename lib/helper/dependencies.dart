import 'package:easyparking/controller/payment/history_controller.dart';
import 'package:easyparking/controller/payment/payment_controller.dart';
import 'package:easyparking/controller/profile/add_vehicle_controller.dart';
import 'package:easyparking/controller/profile/registered_vehicle_controller.dart';
import 'package:easyparking/controller/record/record_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //Registered vehicle controller
  Get.lazyPut(() => RegisteredVehicleController(sharedPreferences: Get.find()));

  //Add vehicle controller
  Get.lazyPut(() => AddVehicleController(sharedPreferences: Get.find()));

  //History controller
  Get.lazyPut(() => HistoryController());

  //Payment controller
  Get.lazyPut(() => PaymentController());

  //Record controller
  Get.lazyPut(() => RecordController());
}
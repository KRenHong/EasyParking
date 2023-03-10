import 'package:easyparking/controller/profile/add_vehicle_controller.dart';
import 'package:easyparking/models/vehicle.dart';
import 'package:easyparking/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class AddVehiclePage extends StatelessWidget {
  const AddVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController vehicleNumberController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    String carPlate = "";
    String desc = "";

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: Dimensions.height30 * 2 + Dimensions.height10,
          bottom: Dimensions.height30,
          left: Dimensions.width30,
          right: Dimensions.width30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back, color: Colors.black, size: Dimensions.iconSize24,)
                    ),
                    SizedBox(width: Dimensions.width20,),
                    Text(
                      "Add Vehicle",
                      style: TextStyle(
                        fontSize: Dimensions.fontSize29, 
                        fontWeight: FontWeight.w600, 
                        height: 1.16,
                        fontFamily: 'Jost'
                      ),
                    )
                  ],
                ),
                SizedBox(height: Dimensions.height20 * 3,),
                Text(
                  "Vehicle Number",
                  style: TextStyle(
                    color: const Color(0xFF959494),
                    fontSize: Dimensions.fontSize16, 
                    fontWeight: FontWeight.w600, 
                    height: 1.16,
                    fontFamily: 'Jost'
                  ),
                ),
                SizedBox(height: Dimensions.height10,),
                Container(
                  width: double.maxFinite,
                  height: Dimensions.height45 + Dimensions.height10,
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                    color: const Color(0xFFD9D9D9)
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      showCursor: true,
                      controller: vehicleNumberController,
                      decoration: const InputDecoration.collapsed(
                        hintText: "EX. HGE 5295"
                      ),
                      onChanged: (value) {
                        carPlate = value;
                      },
                      style: TextStyle(
                      fontSize: Dimensions.fontSize16, 
                      fontWeight: FontWeight.w600, 
                      height: 1.16,
                      fontFamily: 'Jost'
                    ),
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height30,),
                Text(
                  "Description",
                  style: TextStyle(
                    color: const Color(0xFF959494),
                    fontSize: Dimensions.fontSize16, 
                    fontWeight: FontWeight.w600, 
                    height: 1.16,
                    fontFamily: 'Jost'
                  ),
                ),
                SizedBox(height: Dimensions.height10,),
                Container(
                  width: double.maxFinite,
                  height: Dimensions.height45 + Dimensions.height10,
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                    color: const Color(0xFFD9D9D9)
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextField(
                      showCursor: true,
                      controller: descController,
                      decoration: const InputDecoration.collapsed(
                        hintText: "EX. HILUX"
                      ),
                      onChanged: (value) {
                        desc = value;
                      },
                      style: TextStyle(
                      fontSize: Dimensions.fontSize16, 
                      fontWeight: FontWeight.w600, 
                      height: 1.16,
                      fontFamily: 'Jost'
                    ),
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Get.find<AddVehicleController>().addVehicle(
                  Vehicle(carPlate: carPlate, desc: desc)
                );
                return Get.back();
              },
              child: Container(
                width: double.maxFinite,
                height: Dimensions.height10 * 5,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(Dimensions.radius30)
                ),
                child: Center(
                  child: Text(
                    "Update",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.fontSize16, 
                      fontWeight: FontWeight.w700, 
                      height: 1.16,
                      fontFamily: 'Jost'
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
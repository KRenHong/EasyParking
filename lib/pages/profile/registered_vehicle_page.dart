import 'package:easyparking/controller/profile/add_vehicle_controller.dart';
import 'package:easyparking/controller/profile/registered_vehicle_controller.dart';
import 'package:easyparking/models/vehicle.dart';
import 'package:easyparking/routes/route_helper.dart';
import 'package:easyparking/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class RegisteredVehiclePage extends StatefulWidget {
  const RegisteredVehiclePage({super.key});

  @override
  State<RegisteredVehiclePage> createState() => _RegisteredVehiclePageState();

  
}

class _RegisteredVehiclePageState extends State<RegisteredVehiclePage> {

  void removeVehicle(Vehicle vehicle) {
    Get.find<RegisteredVehicleController>().removeVehicle(vehicle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(
          top: Dimensions.height30 * 2 + Dimensions.height10,
          left: Dimensions.width30,
          right: Dimensions.width30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back, color: Colors.black, size: Dimensions.iconSize24,)
                ),
                SizedBox(width: Dimensions.width20,),
                Text(
                  "Registered Vehicle",
                  style: TextStyle(
                    fontSize: Dimensions.fontSize29, 
                    fontWeight: FontWeight.w600, 
                    height: 1.16,
                    fontFamily: 'Jost'
                  ),
                )
              ],
            ),
            SizedBox(height: Dimensions.height30,),
            GetBuilder<AddVehicleController>(builder: (addVehicleController){
              return GetBuilder<RegisteredVehicleController>(builder: (registeredVehicleController) {
                var _vehicleList = registeredVehicleController.getVehicleList();
                return _vehicleList.length > 0? Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Wrap(
                          runSpacing: 20,
                          children: List.generate(_vehicleList.length, (index){
                            var carImgList = AppConstant.carImgList;
                            return Slidable(
                              endActionPane:  ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  // An action can be bigger than the others.
                                  flex: 1,
                                  onPressed: (context) {
                                    return removeVehicle(_vehicleList[index]);
                                  },
                                  backgroundColor: const Color(0xFFFE4A49),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                  label: 'Remove',
                                )
                              ],
                            ),
                              child: Container(
                                width: double.maxFinite,
                                height: Dimensions.height20 * 5,
                                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF4F4F4),
                                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: Dimensions.width10 * 11,
                                      height: Dimensions.height20 * 5,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(carImgList[0])
                                        )
                                      ),
                                    ),
                                    SizedBox(width: Dimensions.width20,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          _vehicleList[index].carPlate,
                                          style: TextStyle(
                                            fontSize: Dimensions.fontSize16, 
                                            fontWeight: FontWeight.w600, 
                                            height: 1.16,
                                            fontFamily: 'Jost'
                                          ),
                                        ),
                                        SizedBox(height: Dimensions.height10/2,),
                                        Text(
                                          _vehicleList[index].desc,
                                          style: TextStyle(
                                            color: const Color(0xFF353535),
                                            fontSize: Dimensions.fontSize12, 
                                            fontWeight: FontWeight.w500, 
                                            height: 1.16,
                                            fontFamily: 'Jost'
                                          )
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                        )
                      ],
                    )
                  )
                ): Expanded(
                  child: Center(
                    child: Container(
                      height: Dimensions.height20 * 15,
                      width: Dimensions.width20 * 15,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppConstant.EMPTY_IMG)
                        )
                      ),
                    ),
                  ),
                );
              });
            })
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
          onTap: () => Get.toNamed(RouteHelper.getAddVehiclePage()),
          child: Container(
            height: Dimensions.height10 * 6,
            width: double.maxFinite,
            margin: EdgeInsets.only(
              top: Dimensions.width30,
              left: Dimensions.width30,
              right: Dimensions.width30,
              bottom: Dimensions.width30
            ),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(249, 192, 51, 0.1),
              borderRadius: BorderRadius.circular(Dimensions.radius30)
            ),
            child: Center(
              child: Text(
                "Add New Vehicle",
                style: TextStyle(
                  color: const Color(0xFFF9C033),
                  fontSize: Dimensions.fontSize16, 
                  fontWeight: FontWeight.w700, 
                  height: 1.16,
                  fontFamily: 'Jost'
                )
              ),
            ),
          ),
        ),
    );
  }
}
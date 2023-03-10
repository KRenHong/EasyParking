import 'package:easyparking/controller/record/record_controller.dart';
import 'package:easyparking/models/parking_record.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class OngoingPage extends StatelessWidget {
  final ParkingRecord parkingRecord;
  const OngoingPage({super.key, required this.parkingRecord});

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
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back, color: Colors.black, size: Dimensions.iconSize24,)
                ),
                SizedBox(width: Dimensions.width20,),
                Text(
                  "Ongoing parking",
                  style: TextStyle(
                    fontSize: Dimensions.fontSize29, 
                    fontWeight: FontWeight.w600, 
                    height: 1.16,
                    fontFamily: 'Jost'
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.height30,),
            Container(
              width: double.maxFinite,
              height: Dimensions.height10 * 19,
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius10),
                color: const Color(0xffF4F4F4)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Parking Area",
                        style: TextStyle(
                          color: AppColors.paleGrey,
                          fontSize: Dimensions.fontSize16, 
                          fontWeight: FontWeight.w500, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                      SizedBox(width: Dimensions.width20,),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            parkingRecord.place,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: Dimensions.fontSize16, 
                              fontWeight: FontWeight.w600, 
                              height: 1.16,
                              fontFamily: 'Jost',
                              overflow: TextOverflow.ellipsis
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Car plate",
                        style: TextStyle(
                          color: AppColors.paleGrey,
                          fontSize: Dimensions.fontSize16, 
                          fontWeight: FontWeight.w500, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                      SizedBox(width: Dimensions.width20,),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "PKR 4542",
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: Dimensions.fontSize16, 
                              fontWeight: FontWeight.w600, 
                              height: 1.16,
                              fontFamily: 'Jost',
                              overflow: TextOverflow.ellipsis
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Parking Spot",
                        style: TextStyle(
                          color: AppColors.paleGrey,
                          fontSize: Dimensions.fontSize16, 
                          fontWeight: FontWeight.w500, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                      SizedBox(width: Dimensions.width20,),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            parkingRecord.subPlace,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: Dimensions.fontSize16, 
                              fontWeight: FontWeight.w600, 
                              height: 1.16,
                              fontFamily: 'Jost',
                              overflow: TextOverflow.ellipsis
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(
                          color: AppColors.paleGrey,
                          fontSize: Dimensions.fontSize16, 
                          fontWeight: FontWeight.w500, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                      SizedBox(width: Dimensions.width20,),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "May 11, 2023",
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: Dimensions.fontSize16, 
                              fontWeight: FontWeight.w600, 
                              height: 1.16,
                              fontFamily: 'Jost',
                              overflow: TextOverflow.ellipsis
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height30,),
            //Get direction button
            InkWell(
              onTap: () {
                if(!parkingRecord.status) {
                  Get.back();
                }
              },
              child: Container(
                width: double.maxFinite,
                height: Dimensions.height10 * 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: AppColors.yellow
                ),
                child: Center(
                  child: Text(
                    parkingRecord.status? "Get Direction" : "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Dimensions.fontSize18, 
                      fontWeight: FontWeight.w700, 
                      height: 1.16,
                      fontFamily: 'Jost'
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: Dimensions.height20,),
            //Done parking button
            GetBuilder<RecordController>(builder: (recordController) {
              return parkingRecord.status? InkWell(
                onTap: () {
                  recordController.doneParking(parkingRecord);
                  Get.back();
                },
                child: Container(
                  width: double.maxFinite,
                  height: Dimensions.height10 * 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.red
                  ),
                  child: Center(
                    child: Text(
                      "Done parking",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Dimensions.fontSize18, 
                        fontWeight: FontWeight.w700, 
                        height: 1.16,
                        fontFamily: 'Jost'
                      ),
                    ),
                  ),
                ),
              ): Container();
            })
          ],
        ),
      ),
    );
  }
}
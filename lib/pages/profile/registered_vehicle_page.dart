import 'package:easyparking/utils/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class RegisteredVehiclePage extends StatelessWidget {
  const RegisteredVehiclePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: Dimensions.height30 * 2 + Dimensions.height10,
          left: Dimensions.width30,
          right: Dimensions.width30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Column(
              children: [
                Wrap(
                  runSpacing: 20,
                  children: List.generate(AppConstant.carImgList.length, (index){
                    var carImgList = AppConstant.carImgList;
                    var carList = AppConstant.carList;
                    var carPlateList = AppConstant.carPlateList;
                    return Container(
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
                                image: AssetImage(carImgList[index])
                              )
                            ),
                          ),
                          SizedBox(width: Dimensions.width20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                carPlateList[index],
                                style: TextStyle(
                                  fontSize: Dimensions.fontSize16, 
                                  fontWeight: FontWeight.w600, 
                                  height: 1.16,
                                  fontFamily: 'Jost'
                                ),
                              ),
                              SizedBox(height: Dimensions.height10/2,),
                              Text(
                                carList[index],
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
                    );
                  }),
                ),
                SizedBox(height: Dimensions.height30,),
                Container(
                  height: Dimensions.height10 * 6,
                  width: double.maxFinite,
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
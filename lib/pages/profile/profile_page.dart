import 'package:easyparking/routes/route_helper.dart';
import 'package:easyparking/utils/app_constant.dart';
import 'package:easyparking/utils/app_text_style.dart';
import 'package:easyparking/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: Dimensions.fontSize29, 
                    fontWeight: FontWeight.w600, 
                    height: 1.16,
                    fontFamily: 'Jost'
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppConstant.MENU_ICON)
                    )
                  ),
                )
              ],
            ),
            SizedBox(height: Dimensions.height20 * 4,),
            Text(
              "Anabia Rani",
              style: TextStyle(
                fontSize: Dimensions.fontSize20, 
                fontWeight: FontWeight.w600, 
                height: 1.16,
                fontFamily: 'Jost'
              ),
            ),
            SizedBox(height: Dimensions.height10/2,),
            Text(
              "anabiajatoi448@gmail.com",
              style: TextStyle(
                fontSize: Dimensions.fontSize14, 
                fontWeight: FontWeight.w400, 
                height: 1.16,
                fontFamily: 'Jost'
              ),
            ),
            SizedBox(height: Dimensions.height20 * 3,),
            Column(
              children: [
                //Edit profile
                Row(
                  children: [
                    Icon(
                      Icons.person_2_outlined, 
                      size: Dimensions.iconSize24, 
                      color: AppColors.paleGrey,
                    ),
                    SizedBox(width: Dimensions.width20,),
                    Text(
                      "Edit profile",
                      style: TextStyle(
                        fontSize: Dimensions.fontSize18, 
                        fontWeight: FontWeight.w500, 
                        height: 1.16,
                        fontFamily: 'Jost'
                      ),
                    )
                  ],
                ),
                SizedBox(height: Dimensions.height30,),
                //Payment
                Row(
                  children: [
                    Icon(
                      Icons.payment_outlined, 
                      size: Dimensions.iconSize24, 
                      color: AppColors.paleGrey,
                    ),
                    SizedBox(width: Dimensions.width20,),
                    Text(
                      "Payment",
                      style: TextStyle(
                        fontSize: Dimensions.fontSize18, 
                        fontWeight: FontWeight.w500, 
                        height: 1.16,
                        fontFamily: 'Jost'
                      ),
                    )
                  ],
                ),
                SizedBox(height: Dimensions.height30,),
                //egistered Vehicle
                InkWell(
                  onTap: () {
                    Get.toNamed(RouteHelper.getRegisteredVehiclePage());
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.car_rental, 
                        size: Dimensions.iconSize24, 
                        color: AppColors.paleGrey,
                      ),
                      SizedBox(width: Dimensions.width20,),
                      Text(
                        "Registered Vehicle",
                        style: TextStyle(
                          fontSize: Dimensions.fontSize18, 
                          fontWeight: FontWeight.w500, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.height30,),
                //Logout
                Row(
                  children: [
                    Icon(
                      Icons.logout_outlined, 
                      size: Dimensions.iconSize24, 
                      color: AppColors.paleGrey,
                    ),
                    SizedBox(width: Dimensions.width20,),
                    Text(
                      "Logout",
                      style: TextStyle(
                        fontSize: Dimensions.fontSize18, 
                        fontWeight: FontWeight.w500, 
                        height: 1.16,
                        fontFamily: 'Jost'
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
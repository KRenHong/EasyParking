
import 'package:easyparking/routes/route_helper.dart';
import 'package:easyparking/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/payment.dart';
import '../../utils/dimensions.dart';

class SummaryPage extends StatelessWidget {
  final Payment payment;
  const SummaryPage({super.key, required this.payment});

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
                  "Review Summary",
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
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              height: Dimensions.height30 * 10 + Dimensions.height20,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(Dimensions.radius20)
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
                          fontSize: Dimensions.fontSize14, 
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
                            "Parking Lot of Sunway Pyramid",
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: Dimensions.fontSize14, 
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
                        "Address",
                        style: TextStyle(
                          color: AppColors.paleGrey,
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w500, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                      Text(
                        "3, Jalan PJS 11/15, Bandar Sunway",
                        style: TextStyle(
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w600, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Vehicle",
                        style: TextStyle(
                          color: AppColors.paleGrey,
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w500, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                      Text(
                        "Toyota Land Cru (AFD 6397)",
                        style: TextStyle(
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w600, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Parking Spot",
                        style: TextStyle(
                          color: AppColors.paleGrey,
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w500, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                      Text(
                        "1st Floor (A05)",
                        style: TextStyle(
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w600, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Date",
                        style: TextStyle(
                          color: AppColors.paleGrey,
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w500, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                      Text(
                        "May 11, 2023",
                        style: TextStyle(
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w600, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Duration",
                        style: TextStyle(
                          color: AppColors.paleGrey,
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w500, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                      Text(
                        "4 hours",
                        style: TextStyle(
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w600, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Hours",
                        style: TextStyle(
                          color: AppColors.paleGrey,
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w500, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                      Text(
                        "09:00 AM  -  13:00 PM",
                        style: TextStyle(
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w600, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height30,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              width: double.maxFinite,
              height: Dimensions.height20 * 8,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(Dimensions.radius20)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amount",
                        style: TextStyle(
                          color: AppColors.paleGrey,
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w500, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                      Text(
                        "MYR8.00",
                        style: TextStyle(
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w600, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Taxes & Fees (10%)",
                        style: TextStyle(
                          color: AppColors.paleGrey,
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w500, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                      Text(
                        "MYR0.8",
                        style: TextStyle(
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w600, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: AppColors.paleGrey, thickness: 1,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          color: AppColors.paleGrey,
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w500, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                      Text(
                        "MYR8.08",
                        style: TextStyle(
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w600, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height30,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              width: double.maxFinite,
              height: Dimensions.height10 * 9,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F4),
                borderRadius: BorderRadius.circular(Dimensions.radius20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: Dimensions.height45,
                        width: Dimensions.height45,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(payment.image)
                          )
                        ),
                      ),
                      SizedBox(width: Dimensions.width20,),
                      Text(
                        payment.title, 
                        style: TextStyle(
                          fontSize: Dimensions.fontSize14, 
                          fontWeight: FontWeight.w600, 
                          height: 1.16,
                          fontFamily: 'Jost'
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(RouteHelper.getPaymentPage()),
                    child: Text(
                      "Change", 
                      style: TextStyle(
                        color: AppColors.yellow,
                        fontSize: Dimensions.fontSize14, 
                        fontWeight: FontWeight.w600, 
                        height: 1.16,
                        fontFamily: 'Jost'
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(Dimensions.height30),
        child: InkWell(
          onTap: () {
            Get.back();
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
                "Continue",
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
      ),
    );
  }
}
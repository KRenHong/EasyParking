import 'package:easyparking/controller/payment/history_controller.dart';
import 'package:easyparking/models/payment.dart';
import 'package:easyparking/routes/route_helper.dart';
import 'package:easyparking/utils/app_constant.dart';
import 'package:easyparking/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> with TickerProviderStateMixin{
  bool paySelected = true;
  int selectedTabIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedTabIndex = tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Payment> paymentList = Get.find<HistoryController>().getPaymentList();

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
          children: [
            Text(
              "History",
              style: TextStyle(
                fontSize: Dimensions.fontSize29, 
                fontWeight: FontWeight.w600, 
                height: 1.16,
                fontFamily: 'Jost'
              ),
            ),
            SizedBox(height: Dimensions.height30,),
            tabbar(),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  //To be pay
                  Container(
                    margin: EdgeInsets.only(top: Dimensions.height20),
                    child: Column(
                      children: [
                        Wrap(
                          runSpacing: 20,
                          children: List.generate(AppConstant.loactionLogo.length, (index) {
                            return InkWell(
                              onTap: () => Get.toNamed(
                                RouteHelper.getSummaryPage(),
                                arguments: paymentList[index]
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
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: Dimensions.height10 * 5,
                                      width: Dimensions.width20 * 4,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(AppConstant.loactionLogo[index])
                                        )
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(left: Dimensions.width20),
                                        child: Text(
                                          AppConstant.locationName[index],
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: Dimensions.fontSize16,
                                            overflow: TextOverflow.ellipsis
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Amount Due",
                                          style: TextStyle(
                                            color: AppColors.paleGrey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: Dimensions.fontSize12
                                          ),
                                        ),
                                        SizedBox(height: Dimensions.height10/2,),
                                        Text(
                                          "MYR 8.00",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: Dimensions.fontSize12
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Center(child: Text("Paid page")),
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }

  Widget tabbar() => TabBar(
    controller: tabController,
    indicatorColor: Colors.white,
    onTap: (value) {
      setState(() {
        selectedTabIndex = value;
      });
    },
    tabs: [
      Container(
        height: Dimensions.height10 * 5,
        width: Dimensions.width10 * 11,
        decoration: BoxDecoration(
          color: selectedTabIndex == 0 ?AppColors.yellow: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          border: Border.all(
            color: selectedTabIndex == 0 ?Colors.white: AppColors.yellow,
            width: 2
          )
        ),
        child: Center(
          child: Text(
            "To be pay",
            style: TextStyle(
              color: selectedTabIndex == 0 ?Colors.white: AppColors.yellow,
              fontWeight: FontWeight.w700,
              fontSize: Dimensions.fontSize16
            ),
          ),
        ),
      ),
      Container(
        height: Dimensions.height10 * 5,
        width: Dimensions.width10 * 11,
        decoration: BoxDecoration(
          color: selectedTabIndex == 1 ?AppColors.yellow: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          border: Border.all(
            color: selectedTabIndex == 1 ? Colors.white: AppColors.yellow,
            width: 2
          )
        ),
        child: Center(
          child: Text(
            "Paid",
            style: TextStyle(
              color: selectedTabIndex == 1 ?Colors.white: AppColors.yellow,
              fontWeight: FontWeight.w700,
              fontSize: Dimensions.fontSize16
            ),
          ),
        ),
      ),
    ],
  );
}
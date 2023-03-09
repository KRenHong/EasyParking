import 'package:easyparking/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';

class InMallParkingPage extends StatefulWidget {
  const InMallParkingPage({super.key});

  @override
  State<InMallParkingPage> createState() => _InMallParkingPage();
}

class _InMallParkingPage extends State<InMallParkingPage>
    with TickerProviderStateMixin {
  int selectedTabIndex = 0;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedTabIndex = tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                top: Dimensions.height30 * 2 + Dimensions.height10,
                bottom: Dimensions.height30),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Find Parking Spot",
                      style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: Dimensions.fontSize29,
                          fontWeight: FontWeight.w600,
                          height: 1.16))
                ],
              ),
              SizedBox(height: Dimensions.height30),
              tabbar(),
              Expanded(child: TabBarView(
                controller: tabController,
                children: [
                  Container(
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/image/in-mall-parking.png'))),
                    child: Stack(children: [
                      Positioned(child: Image.asset('assets/image/Car.png'),
                      left: Dimensions.width10 * 25,
                      bottom: Dimensions.height10 * 10,
                      top: Dimensions.height10 * 34,
                      right: 0.0),

                      Column(mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                              top: 20.0,
                              bottom: 20.0,
                              left: 10.0,
                              right: 10.0
                            ),
                            color: AppColors.yellow, 
                            
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/image/arrow_up.svg'),
                                SizedBox(width: Dimensions.width10,),
                                TextButton(
                                  onPressed: () {  },
                                child: Text("Move forward 20m", 
                                  style: TextStyle(color: Colors.white,
                                  fontFamily: 'Jost',
                                  fontSize: Dimensions.fontSize29,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 1.0)),
                                
                                )
                              ],
                            )
                          ),
                        ],)
                    ],),
                  ),
                  Container(
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/image/in-mall-parking.png'))),
                    child: Stack(),
                  ),
                  Container(
                    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/image/in-mall-parking.png'))),
                    child: Stack(),
                  ),
                ],))
            ])));
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
                width: Dimensions.width10 * 12,
                decoration: BoxDecoration(
                    color:
                        selectedTabIndex == 0 ? AppColors.yellow : Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                    border: Border.all(
                        color: selectedTabIndex == 0
                            ? Colors.white
                            : AppColors.yellow,
                        width: 2)),
                child: Center(
                    child: Text(
                  "1st Floor",
                  style: TextStyle(
                      color: selectedTabIndex == 0
                          ? Colors.white
                          : AppColors.yellow,
                      fontWeight: FontWeight.w700,
                      fontSize: Dimensions.fontSize16),
                ))),
            Container(
                height: Dimensions.height10 * 5,
                width: Dimensions.width10 * 12,
                decoration: BoxDecoration(
                    color:
                        selectedTabIndex == 1 ? AppColors.yellow : Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                    border: Border.all(
                        color: selectedTabIndex == 1
                            ? Colors.white
                            : AppColors.yellow,
                        width: 2)),
                child: Center(
                    child: Text(
                  "2nd Floor",
                  style: TextStyle(
                      color: selectedTabIndex == 1
                          ? Colors.white
                          : AppColors.yellow,
                      fontWeight: FontWeight.w700,
                      fontSize: Dimensions.fontSize16),
                ))),
            Container(
                height: Dimensions.height10 * 5,
                width: Dimensions.width10 * 12,
                decoration: BoxDecoration(
                    color:
                        selectedTabIndex == 2 ? AppColors.yellow : Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius10),
                    border: Border.all(
                        color: selectedTabIndex == 2
                            ? Colors.white
                            : AppColors.yellow,
                        width: 2)),
                child: Center(
                    child: Text(
                  "3rd Floor",
                  style: TextStyle(
                      color: selectedTabIndex == 2
                          ? Colors.white
                          : AppColors.yellow,
                      fontWeight: FontWeight.w700,
                      fontSize: Dimensions.fontSize16),
                ))),
          ]);
}

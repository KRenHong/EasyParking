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
  bool isParkingSelected = false;
  bool startNavigating = false;
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
                left: Dimensions.width10,
                right: Dimensions.width10,
                top: Dimensions.height30 * 2 + Dimensions.height10,
                bottom: Dimensions.height30),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("  Find Parking Spot",
                      style: TextStyle(
                          fontFamily: 'Jost',
                          fontSize: Dimensions.fontSize29,
                          fontWeight: FontWeight.w600,
                          height: 1.16))
                ],
              ),
              SizedBox(height: Dimensions.height30),
              tabbar(),
              Expanded(
                  child: TabBarView(
                controller: tabController,
                children: [
                  // 1st Floor
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/image/in-mall-parking.png'))),
                    child: Stack(
                      children: [
                        Visibility(
                          visible: startNavigating,
                          child: Positioned(
                          left: Dimensions.width30 * 6.3,
                          top: Dimensions.height30 * 11.5,
                          child: SvgPicture.asset('assets/image/fake_route.svg'),),
                         ),
                        
                        Positioned(
                            child: Image.asset('assets/image/Car.png'),
                            left: Dimensions.width20 * .5,
                            top: Dimensions.height20 * 12,
                            right: 0.0),

                            Positioned(
                            left: Dimensions.width30 * 9.8,
                            top: Dimensions.height30 * 14,
                            child: GestureDetector(
                              child: Container(
                                height: Dimensions.height10 * 4,
                                width: Dimensions.width10 * 11,
                                decoration: BoxDecoration(
                                    color: isParkingSelected == true
                                        ? AppColors.yellow
                                        : Colors.amber[50],
                                    border: Border.all(
                                        color: AppColors.yellow, width: 1.0),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius10)),
                                child: const Center(
                                  child: Text(
                                    'A08',
                                    style: TextStyle(
                                        fontFamily: 'Jost',
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  isParkingSelected = !isParkingSelected;
                                  startNavigating = isParkingSelected;
                                });
                              },
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Visibility(
                              visible: startNavigating,
                              child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 20.0,
                                      bottom: 20.0,
                                      left: 10.0,
                                      right: 10.0),
                                  color: AppColors.yellow,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/image/arrow_up.svg'),
                                      SizedBox(
                                        width: Dimensions.width10,
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            _parkSuccessfulDialogBuilder(
                                                context),
                                        child: Text("Move forward 20m",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Jost',
                                                fontSize: Dimensions.fontSize29,
                                                fontWeight: FontWeight.w800,
                                                letterSpacing: 1.0)),
                                      )
                                    ],
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  // 2nd Floor
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/image/in-mall-parking.png'))),
                    child: Stack(
                      children: [
                        Positioned(
                            left: Dimensions.width30 * 9.8,
                            top: Dimensions.height30 * 14,
                            child: GestureDetector(
                              child: Container(
                                height: Dimensions.height10 * 4,
                                width: Dimensions.width10 * 11,
                                decoration: BoxDecoration(
                                    color: isParkingSelected == true
                                        ? AppColors.yellow
                                        : Colors.amber[50],
                                    border: Border.all(
                                        color: AppColors.yellow, width: 1.0),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius10)),
                                child: const Center(
                                  child: Text(
                                    'A08',
                                    style: TextStyle(
                                        fontFamily: 'Jost',
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  isParkingSelected = !isParkingSelected;
                                });
                              },
                            )),
                      ],
                    ),
                  ),
                  // 3rd Floor
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/image/in-mall-parking.png'))),
                    child: Stack(
                      children: [
                        Positioned(
                            left: Dimensions.width30 * 9.8,
                            top: Dimensions.height30 * 14,
                            child: GestureDetector(
                              child: Container(
                                height: Dimensions.height10 * 4,
                                width: Dimensions.width10 * 11,
                                decoration: BoxDecoration(
                                    color: isParkingSelected == true
                                        ? AppColors.yellow
                                        : Colors.amber[50],
                                    border: Border.all(
                                        color: AppColors.yellow, width: 1.0),
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius10)),
                                child: const Center(
                                  child: Text(
                                    'A08',
                                    style: TextStyle(
                                        fontFamily: 'Jost',
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  isParkingSelected = !isParkingSelected;
                                });
                              },
                            )),
                      ],
                    ),
                  ),
                ],
              ))
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

  Future<void> _parkSuccessfulDialogBuilder(BuildContext context) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: Container(
            padding: EdgeInsets.all(20.0),
            width: double.maxFinite,
            height: Dimensions.height20 * 24,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Park Successfully',
                  style: TextStyle(
                      fontFamily: 'Jost',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                const Divider(height: 20.0, color: AppColors.grey),
                const Text('Your car is parked at:',
                    style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: 14.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2)),
                const SizedBox(height: 10.0),
                const Text('A08, First Floor',
                    style: TextStyle(
                        fontFamily: 'Jost',
                        fontSize: 30.0,
                        fontWeight: FontWeight.w800)),
                const SizedBox(
                  height: 10.0,
                ),
                const Image(image: AssetImage('assets/image/sunway_logo.png')),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Car plate',
                        style: TextStyle(
                            fontFamily: 'Jost',
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2)),
                    Text('PKR 6969',
                        style: TextStyle(
                            fontFamily: 'Jost',
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2))
                  ],
                ),
                const Divider(height: 40.0, color: AppColors.grey),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isParkingSelected = false;
                      startNavigating = false;
                    });
                    Get.back();
                  },
                  child: Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.yellow),
                    child: const Center(
                      child: Text('Close',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Jost',
                              fontSize: 24.0,
                              fontWeight: FontWeight.w800)),
                    ),
                  ),
                )
              ],
            ),
          ));
        });
  }
}

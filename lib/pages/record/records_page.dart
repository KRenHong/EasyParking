import 'package:easyparking/models/parking_record.dart';
import 'package:easyparking/routes/route_helper.dart';
import 'package:easyparking/widgets/parking_record_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/record/record_controller.dart';
import '../../utils/app_constant.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> with TickerProviderStateMixin{

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
                  "Records",
                  style: TextStyle(
                    fontSize: Dimensions.fontSize29, 
                    fontWeight: FontWeight.w600, 
                    height: 1.16,
                    fontFamily: 'Jost'
                  ),
                ),
                const Icon(
                  Icons.search_outlined, 
                  color:Color(0xFFCACACA),
                )
              ],
            ),
            SizedBox(height: Dimensions.height30,),
            tabbar(),
            SizedBox(height: Dimensions.height30,),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  //To be pay tab
                  GetBuilder<RecordController>(builder: (recordController) {
                    recordController.getParkingRecordList();
                    var parkingRecordList = recordController.parkingRecordList;
                    return parkingRecordList.length > 0? SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: Dimensions.height20,
                          ),
                          child: Column(
                            children: [
                              Wrap(
                                runSpacing: 20,
                                children: List.generate(parkingRecordList.length, (index) {
                                  var parkingRecord = parkingRecordList[index];
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                        RouteHelper.getOngoingPage(),
                                        arguments: parkingRecord
                                      );
                                    },
                                    child: ParkingRecordBox(parkingRecord: parkingRecord)
                                  );
                                })
                              )
                            ],
                          ),
                        ),
                      ): Center(
                        child: Container(
                          height: Dimensions.height20 * 15,
                          width: Dimensions.width20 * 15,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(AppConstant.EMPTY_IMG)
                            )
                          ),
                        ),
                      );
                  }),
                  //Paid tab
                  GetBuilder<RecordController>(builder: (recordController) {
                    var doneList = recordController.doneList;
                    return doneList.length > 0? SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: [
                            Wrap(
                              runSpacing: 20,
                              children: List.generate(doneList.length, (index) {
                                var doneItem = doneList[index];
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(
                                      RouteHelper.getOngoingPage(),
                                      arguments: doneItem
                                    );
                                  },
                                  child: ParkingRecordBox(parkingRecord: doneItem)
                                );
                              })
                            )
                          ],
                        ),
                      ),
                    ): Center(
                      child: Container(
                        height: Dimensions.height20 * 15,
                        width: Dimensions.width20 * 15,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppConstant.EMPTY_IMG)
                          )
                        ),
                      ),
                    );
                  }),
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
        decoration: BoxDecoration(
          color: selectedTabIndex == 0 ?AppColors.yellow: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius30),
          border: Border.all(
            color: selectedTabIndex == 0 ?Colors.white: AppColors.yellow,
            width: 2
          )
        ),
        child: Center(
          child: Text(
            "Ongoing",
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
        decoration: BoxDecoration(
          color: selectedTabIndex == 1 ?AppColors.yellow: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius30),
          border: Border.all(
            color: selectedTabIndex == 1 ? Colors.white: AppColors.yellow,
            width: 2
          )
        ),
        child: Center(
          child: Text(
            "Completed",
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


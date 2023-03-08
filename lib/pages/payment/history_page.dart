import 'package:easyparking/controller/payment/history_controller.dart';
import 'package:easyparking/models/payment.dart';
import 'package:easyparking/routes/route_helper.dart';
import 'package:easyparking/utils/app_constant.dart';
import 'package:easyparking/utils/colors.dart';
import 'package:easyparking/widgets/history_record_box.dart';
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
                  //To be pay tab
                  GetBuilder<HistoryController>(builder: (historyController) {
                    var paymentRecordList = historyController.getPaymentRecordList();
                    return Container(
                      margin: EdgeInsets.only(top: Dimensions.height20),
                      child: Column(
                        children: [
                          Wrap(
                            runSpacing: 20,
                            children: List.generate(paymentRecordList.length, (index) {
                              var paymentRecord = paymentRecordList[index];
                              return InkWell(
                                onTap: () => Get.toNamed(
                                  RouteHelper.getSummaryPage(Payment.encode(paymentList[3])),
                                  arguments: paymentRecord
                                ),
                                child: HistoryRecordBox(paymentRecord: paymentRecord)
                              );
                            })
                          )
                        ],
                      ),
                    );
                  }),
                  //Paid tab
                  GetBuilder<HistoryController>(builder: (historyController) {
                    var paidRecordList = historyController.getPaidRecord();
                    return paidRecordList.length > 0?Container(
                      margin: EdgeInsets.only(top: Dimensions.height20),
                      child: Column(
                        children: [
                          Wrap(
                            runSpacing: 20,
                            children: List.generate(paidRecordList.length, (index) {
                              var paidRecord = paidRecordList[index];
                              return HistoryRecordBox(paymentRecord: paidRecord);
                            })
                          )
                        ],
                      ),
                    ): Center(
                      child: Container(
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
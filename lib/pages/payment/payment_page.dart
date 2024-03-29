import 'package:easyparking/controller/payment/payment_controller.dart';
import 'package:easyparking/models/payment_record.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/payment.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constant.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';

class PaymentPage extends StatefulWidget {
  final PaymentRecord paymentRecord;
  Payment payment;
  PaymentPage({super.key, required this.paymentRecord, required this.payment});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String title = Get.find<PaymentController>().payment;

  Payment getPayment(String value) {
    for(Payment item in AppConstant.paymentList) {
      if(item.title == value) {
        widget.payment = item;
        break;
      }
    }
    return widget.payment;
  }

  void setPaymentType(Payment payment) {
    Get.find<PaymentController>().setPaymentType(payment.title);
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
          bottom: Dimensions.height30
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Icon(Icons.arrow_back, color: Colors.black, size: Dimensions.iconSize24,)
                    ),
                    SizedBox(width: Dimensions.width20,),
                    Text(
                      "Payment",
                      style: TextStyle(
                        fontSize: Dimensions.fontSize29, 
                        fontWeight: FontWeight.w600, 
                        height: 1.16,
                        fontFamily: 'Jost'
                      ),
                    ),
                  ],
                ),
                Icon(Icons.qr_code_scanner_outlined, color: Colors.black, size: Dimensions.iconSize24)
              ],
            ),
            SizedBox(height: Dimensions.height30,),
            Text(
              "Choose Payment Methods",
              style: TextStyle(
                fontSize: Dimensions.fontSize20, 
                fontWeight: FontWeight.w600, 
                height: 1.16,
                fontFamily: 'Jost'
              ),
            ),
            SizedBox(height: Dimensions.height30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GetBuilder<PaymentController>(builder: (paymentController){
                  title = Get.find<PaymentController>().payment;
                  print(title);
                  return  Wrap(
                      children: List.generate(AppConstant.paymentList.length, (index) {
                        var paymentList = AppConstant.paymentList;
                        var payment = paymentList[index];
                        return InkWell(
                          onTap: () {
                            return paymentController.setPaymentType(payment.title);
                          } ,
                          child: Container(
                            width: double.maxFinite,
                            height: Dimensions.height10 * 9,
                            margin: EdgeInsets.only(bottom: Dimensions.height20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: const Color(0xFFF4F4F4),
                            ),
                            child: Center(
                              child: ListTile(
                                leading: Container(
                                  height: Dimensions.height45,
                                  width: Dimensions.height45,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(payment.image)
                                    )
                                  ),
                                ),
                                title: Text(
                                  payment.title,
                                  style: TextStyle(
                                    fontSize: Dimensions.fontSize16, 
                                    fontWeight: FontWeight.w600, 
                                    height: 1.16,
                                    fontFamily: 'Jost'
                                  ),
                                ),
                                trailing: Radio(
                                  activeColor: AppColors.yellow,
                                  value: payment.title,
                                  groupValue: title,
                                  onChanged: (value) {
                                    setState(() {
                                      if(value == null) {
                                        getPayment("Google Play");
                                      } else {
                                        title = value;
                                        setPaymentType(getPayment(value));
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                })
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(Dimensions.height30),
        child: InkWell(
          onTap: () {
            Get.offNamed(
              RouteHelper.getSummaryPage(Payment.encode(widget.payment)),
              arguments: widget.paymentRecord
            );
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
      )
    );
  }
}
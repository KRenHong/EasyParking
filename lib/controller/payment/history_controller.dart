import 'dart:math';

import 'package:easyparking/models/payment.dart';
import 'package:easyparking/utils/app_constant.dart';
import 'package:get/get.dart';

import '../../models/payment_record.dart';

class HistoryController extends GetxController implements GetxService{
  HistoryController();

  List<PaymentRecord> paidRecordList = [];

  List<Payment> getPaymentList() {
    return AppConstant.paymentList;
  }

  List<PaymentRecord> getPaymentRecordList() {
    return AppConstant.paymentRecordList;
  }

  void paid(PaymentRecord paymentRecord) {
    List<PaymentRecord> list = getPaymentRecordList();
    list.removeWhere((element) {
      if(element.title == paymentRecord.title) {
        paidRecordList.add(element);
      }
      return element.title == paymentRecord.title;
    });
    update();
  }

  List<PaymentRecord> getPaidRecord() {
    return paidRecordList.reversed.toList();
  }
}
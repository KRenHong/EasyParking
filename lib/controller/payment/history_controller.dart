import 'package:easyparking/models/payment.dart';
import 'package:easyparking/utils/app_constant.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController implements GetxService{
  HistoryController();

  List<Payment> getPaymentList() {
    return AppConstant.paymentList;
  }

  void paid(Payment payment) {
    List<Payment> list = getPaymentList();
    list.removeWhere((element) => element.title == payment.title);
    update();
  }
}
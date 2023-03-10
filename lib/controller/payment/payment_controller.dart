import 'package:easyparking/models/payment.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController implements GetxService{
  PaymentController();

  String _payment = "****  ****  ****  ****  7890";
  String get payment => _payment;

  void setPaymentType(String payment) {
    _payment = payment;
    update();
  }
}
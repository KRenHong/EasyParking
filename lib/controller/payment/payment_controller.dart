import 'package:easyparking/models/payment.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController implements GetxService{
  PaymentController();

  late Payment _payment;
  Payment get payment => _payment;

  void setPaymentType(Payment payment) {
    _payment = payment;
    update();
  }
}
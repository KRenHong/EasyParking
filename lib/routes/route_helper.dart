import 'package:easyparking/models/parking_record.dart';
import 'package:easyparking/models/payment.dart';
import 'package:easyparking/models/payment_record.dart';
import 'package:easyparking/pages/home/home_page.dart';
import 'package:easyparking/pages/navigation/in_mall_parking_page.dart';
import 'package:easyparking/pages/payment/history_page.dart';
import 'package:easyparking/pages/payment/payment_page.dart';
import 'package:easyparking/pages/payment/summary_page.dart';
import 'package:easyparking/pages/profile/add_vehicle_page.dart';
import 'package:easyparking/pages/profile/registered_vehicle_page.dart';
import 'package:easyparking/pages/record/ongoing_page.dart';
import 'package:get/get.dart';

import '../pages/profile/profile_page.dart';

class RouteHelper{
  static const String homePage = "/home-page";
  static const String historyPage = "/history-page";
  static const String summaryPage = "/summary-page";
  static const String paymentPage = "/payment-page";
  static const String profilePage = "/profile-page";
  static const String registeredVehiclePage = "/registered-vehicle-page";
  static const String addVehiclePage = "/add-vehicle-page";
  static const String ongoingPage = "/ongoing-page";
  static const String inMarkParkingPage = "/in-mark-parking-page";

  static getHomePage() => homePage;
  static getHistoryPage() => historyPage;
  static getSummaryPage(String payment) => '$summaryPage?payment=$payment';
  static getPaymentPage(String payment) => '$paymentPage?payment=$payment';
  static getProfilePage() => profilePage;
  static getRegisteredVehiclePage() => registeredVehiclePage;
  static getAddVehiclePage() => addVehiclePage;
  static getOngoingPage() => ongoingPage;
  static getInMarkParkingPage() => inMarkParkingPage;

  static List<GetPage> routes = [
    //Profile page route
    GetPage(name: profilePage, page: () => const ProfilePage()),
    
    //Registered vehicle page route
    GetPage(name: registeredVehiclePage, page: () => const RegisteredVehiclePage()),

    //Add vehicle page route
    GetPage(name: addVehiclePage, page: () => const AddVehiclePage()),

    //History page route
    GetPage(name: historyPage, page: () => const HistoryPage()),

    //InMarkParking page route
    GetPage(name: inMarkParkingPage, page: () => const InMallParkingPage()),

    //Payment page route
    GetPage(name: paymentPage, page: () {
      PaymentRecord paymentRecord = Get.arguments;
      Payment payment = Payment.decode(Get.parameters['payment']!);
      return PaymentPage(paymentRecord: paymentRecord, payment: payment,);
    }),

    //Summary page route
    GetPage(name: summaryPage, page: () {
      PaymentRecord paymentRecord = Get.arguments;
      Payment payment = Payment.decode(Get.parameters['payment']!);
      return SummaryPage(paymentRecord: paymentRecord, payment: payment,);
    }),

    GetPage(name: ongoingPage, page: () {
      ParkingRecord parkingRecord = Get.arguments;
      return OngoingPage(parkingRecord: parkingRecord);
    }),

    //Home page route
    GetPage(name: homePage, page: () => const HomePage()),
  ];


}
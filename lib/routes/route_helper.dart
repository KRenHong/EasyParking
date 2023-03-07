import 'package:easyparking/models/payment.dart';
import 'package:easyparking/pages/home/home_page.dart';
import 'package:easyparking/pages/payment/history_page.dart';
import 'package:easyparking/pages/payment/payment_page.dart';
import 'package:easyparking/pages/payment/summary_page.dart';
import 'package:easyparking/pages/profile/add_vehicle_page.dart';
import 'package:easyparking/pages/profile/registered_vehicle_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/profile/profile_page.dart';

class RouteHelper{
  static const String homePage = "/home-page";
  static const String historyPage = "/history-page";
  static const String summaryPage = "/summary-page";
  static const String paymentPage = "/payment-page";
  static const String profilePage = "/profile-page";
  static const String registeredVehiclePage = "/registered-vehicle-page";
  static const String addVehiclePage = "/add-vehicle-page";

  static getHomePage() => homePage;
  static getHistoryPage() => historyPage;
  static getSummaryPage() => summaryPage;
  static getPaymentPage() => paymentPage;
  static getProfilePage() => profilePage;
  static getRegisteredVehiclePage() => registeredVehiclePage;
  static getAddVehiclePage() => addVehiclePage;

  static List<GetPage> routes = [
    //Profile page route
    GetPage(name: profilePage, page: () => const ProfilePage()),
    
    //Registered vehicle page route
    GetPage(name: registeredVehiclePage, page: () => const RegisteredVehiclePage()),

    //Add vehicle page route
    GetPage(name: addVehiclePage, page: () => const AddVehiclePage()),

    //History page route
    GetPage(name: historyPage, page: () => const HistoryPage()),

    //Payment page route
    GetPage(name: paymentPage, page: () => const PaymentPage()),

    //Summary page route
    GetPage(name: summaryPage, page: () {
      Payment payment = Get.arguments;
      return SummaryPage(payment: payment);
    }),

    //Home page route
    GetPage(name: homePage, page: () => const HomePage()),
  ];


}
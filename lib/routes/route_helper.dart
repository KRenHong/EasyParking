import 'package:easyparking/pages/home/home_page.dart';
import 'package:easyparking/pages/payment/payment_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/profile/profile_page.dart';

class RouteHelper{
  static const String homePage = "/home-page";
  static const String paymentPage = "/payment-page";
  static const String profilePage = "/profile-page";

  static getHomePage() => homePage;
  static getPaymentPage() => paymentPage;
  static getProfilePage() => profilePage;

  static List<GetPage> routes = [
    //Profile page route
    GetPage(name: profilePage, page: () => const ProfilePage()),

    //Payment page route
    GetPage(name: paymentPage, page: () => const PaymentPage()),

    //Home page route
    GetPage(name: homePage, page: () => const HomePage()),
  ];


}
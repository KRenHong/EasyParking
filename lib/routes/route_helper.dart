import 'package:easyparking/pages/home/home_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../pages/profile/profile_page.dart';

class RouteHelper{
  static const String homePage = "/home-page";
  static const String profilePage = "/profile-page";

  static getHomePage() => homePage;
  static getProfilePage() => profilePage;

  static List<GetPage> routes = [
    GetPage(name: profilePage, page: () => const ProfilePage()),
    GetPage(name: homePage, page: () => const HomePage()),
  ];


}
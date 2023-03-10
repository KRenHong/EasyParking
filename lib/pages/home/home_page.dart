import 'package:easyparking/pages/navigation/in_mall_parking_page.dart';
import 'package:easyparking/pages/navigation/navigation_page.dart';
import 'package:easyparking/pages/payment/history_page.dart';
import 'package:easyparking/pages/record/records_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/colors.dart';
import '../profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  List pages = [
    const InMallParkingPage(),
    const RecordPage(),
    const HistoryPage(),
    const ProfilePage()
  ];


  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.yellow,
        unselectedItemColor: AppColors.grey,
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.gps_fixed),
            label: "Navigation"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: "Records"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment_outlined),
            label: "Payment"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile"
          ),
        ],
      )
    );
  }
}
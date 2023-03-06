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
    Container(),
    Container(),
    Container(),
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
            icon: Icon(Icons.home_outlined),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
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
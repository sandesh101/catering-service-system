import 'package:catering_service/constant.dart';
import 'package:catering_service/view/bottom_bar_pages/cart_page.dart';
import 'package:catering_service/view/bottom_bar_pages/home_page.dart';
import 'package:catering_service/view/bottom_bar_pages/menu_list.dart';
import 'package:catering_service/view/bottom_bar_pages/profile_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  var _currentIndex = 0;
  final screens = [
    //HomePage
    const HomePage(),
    const MenuListPage(),
    const CartPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 55.0,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        animationCurve: Curves.easeInOutQuad,
        backgroundColor: ColorConstant.primaryColor,
        animationDuration: const Duration(milliseconds: 600),
        color: ColorConstant.blackColor,
        items: [
          Icon(
            Iconsax.home,
            color: ColorConstant.primaryColor,
            size: 25,
          ),
          Icon(
            Iconsax.shopping_bag,
            color: ColorConstant.primaryColor,
            size: 25,
          ),
          Icon(
            Iconsax.shopping_cart,
            color: ColorConstant.primaryColor,
            size: 25,
          ),
          Icon(
            Iconsax.user,
            color: ColorConstant.primaryColor,
            size: 25,
          ),
        ],
      ),
    );
  }
}

import 'package:catering_service/constant.dart';
import 'package:flutter/material.dart';

class MenuListPage extends StatefulWidget {
  const MenuListPage({super.key});

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Menu List Page',
          style: AppTextStyle.normalText(fontSize: 24),
        ),
      ),
    );
  }
}

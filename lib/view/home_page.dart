import 'package:catering_service/constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Hello",
          style: AppTextStyle.normalText(),
        ),
      ),
    );
  }
}

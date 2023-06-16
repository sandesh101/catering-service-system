import 'package:catering_service/constant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          title: Text(
            "HotCase",
            style: AppTextStyle.normalText(
                color: ColorConstant.secondaryColor, fontSize: 24),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            //User Info
            Positioned(
              top: MediaQuery.of(context).size.height * 0.0,
              left: 0,
              right: 0,
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        child: Image(
                          image: AssetImage('assets/images/samosa.png'),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hi, Sandesh",
                            style: AppTextStyle.normalText(fontSize: 20),
                          ),
                          Text(
                            "Let's Grab the Food!!",
                            style: AppTextStyle.normalText(
                                fontSize: 16, color: const Color(0xFF797373)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //Slider
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              // left: MediaQuery.of(context).size.width * 0.01,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.95,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.95,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.95,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:catering_service/constant.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _groupValue = 0;
  final images = [
    "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/1640774/pexels-photo-1640774.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "https://images.pexels.com/photos/406152/pexels-photo-406152.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: ColorConstant.primaryColor,
        appBar: AppBar(
          // backgroundColor: ColorConstant.primaryColor,
          elevation: 2.0,
          title: Text(
            "HotCase",
            style: AppTextStyle.normalText(
              color: ColorConstant.blackColor,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          alignment: AlignmentDirectional.center,
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
                            style: AppTextStyle.normalText(
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Let's Grab the Food!!",
                            style: AppTextStyle.normalText(
                              fontSize: 16,
                              color: const Color(0xFF797373),
                            ),
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
              top: MediaQuery.of(context).size.height * 0.13,
              left: 0,
              right: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child:
                              Image.network(fit: BoxFit.cover, images[index]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            //Slider End
            //Nepali Date Picker
            Positioned(
              top: MediaQuery.of(context).size.height * 0.38,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  left: MediaQuery.of(context).size.height * 0.02,
                  right: MediaQuery.of(context).size.height * 0.02,
                ),
                child: TextFormField(
                  onTap: () {
                    print("TAPPED");
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    prefixIcon: const Icon(
                      Iconsax.calendar,
                      color: Colors.black,
                    ),

                    // prefixIconColor: Constant.secondaryColor,
                    label: Text(
                      "Pick a Date",
                      style: AppTextStyle.normalText(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: ColorConstant.secondaryColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color(0xFF827C7C),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //Food Items
            Positioned(
              top: MediaQuery.of(context).size.height * 0.46,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  left: MediaQuery.of(context).size.height * 0.02,
                  right: MediaQuery.of(context).size.height * 0.02,
                ),
                child: TextFormField(
                  onTap: () {
                    print("TAPPED");
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    prefixIcon: const Icon(
                      Iconsax.bag_happy,
                      color: Colors.black,
                    ),

                    // prefixIconColor: Constant.secondaryColor,
                    label: Text(
                      "Food Items",
                      style: AppTextStyle.normalText(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: ColorConstant.secondaryColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color(0xFF827C7C),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //Food Items end
            //Number of people
            Positioned(
              top: MediaQuery.of(context).size.height * 0.54,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  left: MediaQuery.of(context).size.height * 0.02,
                  right: MediaQuery.of(context).size.height * 0.02,
                ),
                child: TextFormField(
                  onTap: () {
                    print("TAPPED");
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    prefixIcon: const Icon(
                      Iconsax.people,
                      color: Colors.black,
                    ),

                    // prefixIconColor: Constant.secondaryColor,
                    label: Text(
                      "Number of People",
                      style: AppTextStyle.normalText(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: ColorConstant.secondaryColor,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color(0xFF827C7C),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //Radio BUuttons
            Positioned(
              top: MediaQuery.of(context).size.height * 0.64,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Radio(
                        activeColor: ColorConstant.accentColor,
                        value: 0,
                        groupValue: _groupValue,
                        onChanged: handleRadio,
                      ),
                      Text(
                        "Packing",
                        style: AppTextStyle.normalText(),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor: ColorConstant.accentColor,
                        value: 1,
                        groupValue: _groupValue,
                        onChanged: handleRadio,
                      ),
                      Text(
                        "In-House",
                        style: AppTextStyle.normalText(),
                      )
                    ],
                  ),
                ],
              ),
            ),
            //Radio BUuttons
            Positioned(
              top: MediaQuery.of(context).size.height * 0.72,
              // left: ,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorConstant.secondaryColor,
                ),
                child: Center(
                  child: Text(
                    "CONFIRM",
                    style: AppTextStyle.normalText(
                      color: ColorConstant.primaryColor,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          animationCurve: Curves.fastEaseInToSlowEaseOut,
          backgroundColor: ColorConstant.primaryColor,
          animationDuration: const Duration(milliseconds: 600),
          color: ColorConstant.blackColor,
          items: [
            Icon(
              Iconsax.home,
              color: ColorConstant.primaryColor,
              size: 30,
            ),
            Icon(
              Iconsax.shopping_bag,
              color: ColorConstant.primaryColor,
              size: 30,
            ),
            Icon(
              Iconsax.shopping_cart,
              color: ColorConstant.primaryColor,
              size: 30,
            ),
            Icon(
              Iconsax.user,
              color: ColorConstant.primaryColor,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }

  void handleRadio(int? value) {
    setState(() {
      _groupValue = value!;
      print(_groupValue);
    });
  }
}

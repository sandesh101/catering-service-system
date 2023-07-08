import 'package:catering_service/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;

import '../widgets/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userData;
  Future<void> getData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot documentSnapshot = await ref.doc(currentUser!.uid).get();

    if (documentSnapshot.exists) {
      userData = documentSnapshot.data() as Map<String, dynamic>;
      print(userData);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  var dateController = TextEditingController();
  var foodItemController = TextEditingController();
  var noOfPeopleController = TextEditingController();
  // NepaliDateTime pickedDate;
  NepaliDateTime? _selectedDateTime;
  String? selectedCategory;
  int _groupValue = 0;

  void pickDate() async {
    _selectedDateTime = await picker.showMaterialDatePicker(
      context: context,
      initialDate: NepaliDateTime.now(),
      firstDate: NepaliDateTime(2080),
      lastDate: NepaliDateTime(2081),
      initialDatePickerMode: DatePickerMode.day,
      // locale:
    );
    if (_selectedDateTime != null) {
      dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDateTime!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5.0,
          title: Text(
            "HotCase",
            style: AppTextStyle.normalText(
              color: ColorConstant.blackColor,
              fontSize: 24,
            ),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        //User Info
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.03),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage:
                                        NetworkImage(userData['image']),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Hi, ${userData['name']}",
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
                          child: const Sliders(),
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
                            child: GestureDetector(
                              onTap: () {
                                pickDate();
                              },
                              child: AbsorbPointer(
                                child: TextFormField(
                                  // keyboardType: TextInputType.datetime,
                                  controller: dateController,

                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.fromLTRB(
                                        20.0, 10.0, 20.0, 0.0),
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
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(
                                    20.0, 10.0, 20.0, 0.0),
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
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(
                                    20.0, 10.0, 20.0, 0.0),
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
                                    style: AppTextStyle.normalText(
                                      fontSize: 18,
                                    ),
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
                                    style: AppTextStyle.normalText(
                                      fontSize: 18,
                                    ),
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
        ),
      ),
    );
  }

  void handleRadio(int? value) {
    setState(() {
      _groupValue = value!;
      // print(_groupValue);
    });
  }
}

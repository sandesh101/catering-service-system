import 'package:catering_service/constant.dart';
import 'package:catering_service/provider/cart_provider.dart';
import 'package:catering_service/provider/radio_provider.dart';
import 'package:catering_service/view/widgets/available_items.dart';
import 'package:catering_service/view/widgets/custom_snackbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart' as picker;
import 'package:provider/provider.dart';

// import '../widgets/slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  User? currentUser = FirebaseAuth.instance.currentUser;
  bool isPacking = false;
  String? selectedFoodItem;
  var userData;
  Future<void> getData() async {
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    DocumentSnapshot documentSnapshot = await ref.doc(currentUser!.uid).get();

    if (documentSnapshot.exists) {
      userData = documentSnapshot.data() as Map<String, dynamic>;
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
    return Scaffold(
      appBar: AppBar(
        elevation: 5.0,
        title: const Text("HotCase"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        // alignment: AlignmentDirectional.center,
                        children: [
                          //User Info
                          Padding(
                            padding: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.05),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                color: ColorConstant.cardColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                        radius: 35,
                                        backgroundImage:
                                            NetworkImage(userData['image'])),
                                    // AssetImage(
                                    //     'assets/images/default_user.png')),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                          // const Sliders(),
                          //Slider End
                          //Available items
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 8.0),
                            child: Align(
                              alignment: AlignmentDirectional.topStart,
                              child: Text(
                                "Available Items",
                                style: AppTextStyle.boldText(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const AvailableItems(),
                          //Nepali Date Picker
                          Padding(
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Date is required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          //Food Items
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                              left: MediaQuery.of(context).size.height * 0.02,
                              right: MediaQuery.of(context).size.height * 0.02,
                            ),
                            child: TextFormField(
                              controller: foodItemController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(
                                    20.0, 10.0, 20.0, 0.0),
                                prefixIcon: const Icon(
                                  Iconsax.bag_happy,
                                  color: Colors.black,
                                ),

                                // prefixIconColor: Constant.secondaryColor,
                                label: Text(
                                  "Select Food Items",
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Items required";
                                }
                                return null;
                              },
                            ),
                          ),
                          //Food Items end
                          //Number of people
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.02,
                              left: MediaQuery.of(context).size.height * 0.02,
                              right: MediaQuery.of(context).size.height * 0.02,
                            ),
                            child: TextFormField(
                              controller: noOfPeopleController,
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
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Number required";
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //Radio BUuttons
                          Consumer<RadioProvider>(
                            builder: (context, radio, _) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      activeColor: ColorConstant.accentColor,
                                      value: 0,
                                      groupValue: radio.groupValue,
                                      onChanged: radio.handleRadio,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      activeColor: ColorConstant.accentColor,
                                      value: 1,
                                      groupValue: radio.groupValue,
                                      onChanged: radio.handleRadio,
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
                          const SizedBox(
                            height: 30,
                          ),
                          //Radio BUuttons
                          Consumer<CartProvider>(
                            builder: (context, cart, _) => GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  await cart
                                      .uploadDataToFirebase(
                                        dateController.text,
                                        foodItemController.text,
                                        noOfPeopleController.text,
                                        isPacking,
                                      )
                                      .then(
                                        (value) => CustomSnackbar.showSnack(
                                            context,
                                            "Added to Cart",
                                            ColorConstant.accentColor),
                                      );
                                  await cart.getOrders();
                                }
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.7,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ColorConstant.secondaryColor,
                                ),
                                child: Center(
                                  child: cart.isUploading
                                      ? Lottie.asset(
                                          'assets/animations/loading.json')
                                      : Text(
                                          "CONFIRM",
                                          style: AppTextStyle.normalText(
                                            color: ColorConstant.primaryColor,
                                            fontSize: 20,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
          ),
        ),
      ),
    );
  }
}

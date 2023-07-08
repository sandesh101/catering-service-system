import 'dart:io';

import 'package:catering_service/constant.dart';
import 'package:catering_service/controllers/auth_controller.dart';
import 'package:catering_service/provider/auth_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:catering_service/provider/image_picker_provider.dart';
import 'package:catering_service/view/widgets/custom_snackbar.dart';
import 'package:cross_file_image/cross_file_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import 'dart:math' as math;

import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthController _authController = AuthController();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  XFile? image;
  bool isPickedImage = false;
  bool isTakingImage = false;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _addressController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String imageUniqueName = '';
  String imageURL = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Provider.of<AuthProvider>(context, listen: false);
    });
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        isTakingImage = true;
        print(isTakingImage);
      });
      imageURL = await uploadProfileImages(image);
      print("IMAGE URL: $imageURL");
      setState(() {
        // image = XFile(pickedImage.path);
        isTakingImage = false;
        print(isTakingImage);
        imageUniqueName =
            DateTime.now().millisecondsSinceEpoch.toString() + image!.name;
        isPickedImage = true;
      });
    }
  }

  //Function to upload images to cloud storage
  Future<String> uploadProfileImages(dynamic image) async {
    String? downloadUrl;
    try {
      Reference ref = _firebaseStorage
          .ref()
          .child('user_profile_images')
          .child(imageUniqueName);
      UploadTask uploadTask = ref.putFile(File(image.path).absolute);
      TaskSnapshot taskSnapshot = await uploadTask;

      downloadUrl = await taskSnapshot.ref.getDownloadURL();
    } catch (e) {
      print("Uploading: ${e.toString()}");
    }
    return downloadUrl!;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        body: Form(
          key: _key,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.0,
                    left: MediaQuery.of(context).size.height * 0.17,
                    right: 0,
                    // bottom: MediaQuery.of(context).size.height * 0.4,
                    child: Transform.rotate(
                      angle: -22 * (math.pi / 180),
                      child: Opacity(
                        opacity: 0.3,
                        child: Image(
                          height: MediaQuery.of(context).size.height * 0.8,
                          width: MediaQuery.of(context).size.width * 0.9,
                          image: const AssetImage('assets/images/samosa.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.4,
                    right: MediaQuery.of(context).size.height * 0.17,
                    child: Transform.rotate(
                      angle: -22 * (math.pi / 180),
                      child: Opacity(
                        opacity: 0.3,
                        child: Image(
                          height: MediaQuery.of(context).size.height * 0.8,
                          width: MediaQuery.of(context).size.width * 0.9,
                          image: const AssetImage('assets/images/jeri.png'),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.15,
                    left: MediaQuery.of(context).size.width * 0.2,
                    right: 0,
                    child: Text(
                      'CREATE ACCOUNT ',
                      style: AppTextStyle.normalText(fontSize: 24),
                    ),
                  ),

                  //Image Picker Field
                  Positioned(
                    top: MediaQuery.sizeOf(context).height * 0.2,
                    // left: MediaQuery.sizeOf(context).width * 0.5,
                    child: Consumer<ImagePickerProvider>(
                      builder: (context, value, _) => GestureDetector(
                        onTap: () async {
                          pickImage();
                        },
                        child: isTakingImage
                            ? const CircleAvatar(
                                radius: 40,
                                child: CircularProgressIndicator(),
                              )
                            : CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.red,
                                backgroundImage: isPickedImage
                                    ? XFileImage(image!)
                                    : const AssetImage(
                                            'assets/images/default_user.png')
                                        as ImageProvider),
                      ),
                    ),
                  ),
                  Positioned(
                      top: MediaQuery.sizeOf(context).height * 0.25,
                      left: MediaQuery.sizeOf(context).width * 0.54,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              pickImage();
                            },
                            icon: const Icon(Iconsax.gallery),
                          ),
                        ),
                      )),
                  //Image Picker Field

                  //Fullname Field
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.3,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.height * 0.02,
                        right: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                          prefixIcon: const Icon(Iconsax.user),
                          // prefixIconColor: Constant.secondaryColor,
                          label: Text(
                            "Full Name",
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
                          if (value!.isEmpty) {
                            return "Name can't be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  //Phone Field
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.37,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.height * 0.02,
                        right: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                          prefixIcon: const Icon(
                            Iconsax.mobile,
                            color: Colors.black,
                          ),
                          label: Text(
                            "Phone",
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
                          if (value!.isEmpty) {
                            return "Phone can't be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.44,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.height * 0.02,
                        right: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                          prefixIcon: const Icon(
                            Icons.mail_outline,
                            color: Colors.black,
                          ),
                          label: Text(
                            "Email",
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
                          if (value!.isEmpty) {
                            return "Email can't be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  //Password Field
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.51,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.height * 0.02,
                        right: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: Consumer<AuthProvider>(
                        builder: (context, value, _) => TextFormField(
                          controller: _passwordController,
                          obscureText: value.isPassword,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 20.0, 0.0),
                            prefixIcon: const Icon(
                              Iconsax.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                value.setIsPassword();
                                // print(value.isPassword);
                              },
                              icon: Icon(
                                value.isPassword
                                    ? Iconsax.eye
                                    : Iconsax.eye_slash,
                              ),
                            ),
                            // prefixIconColor: Constant.secondaryColor,
                            label: Text(
                              "Password",
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
                            if (value!.isEmpty) {
                              return "Password can't be empty";
                            } else if (_passwordController.text.trim() !=
                                _confirmPasswordController.text.trim()) {
                              return "Password and Confirm must match";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  //Confirm Password Field
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.58,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.height * 0.02,
                        right: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: Consumer<AuthProvider>(
                        builder: (context, passValue, _) => TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: passValue.isConfirmPassword,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.fromLTRB(
                                20.0, 10.0, 20.0, 0.0),
                            prefixIcon: const Icon(
                              Iconsax.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                passValue.setIsConfirmPassword();
                                // print(value.isPassword);
                              },
                              icon: Icon(
                                passValue.isConfirmPassword
                                    ? Iconsax.eye
                                    : Iconsax.eye_slash,
                              ),
                            ),
                            // prefixIconColor: Constant.secondaryColor,
                            label: Text(
                              "Confirm Password",
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
                            if (value!.isEmpty) {
                              return "Confirm Password can't be empty";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  //Email Field
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.65,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02,
                        left: MediaQuery.of(context).size.height * 0.02,
                        right: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: TextFormField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                          prefixIcon: const Icon(Iconsax.location),
                          // prefixIconColor: Constant.secondaryColor,
                          label: Text(
                            "Address",
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
                          if (value!.isEmpty) {
                            return "Address can't be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.78,
                    left: MediaQuery.of(context).size.width * 0.03,
                    right: MediaQuery.of(context).size.width * 0.03,
                    child: Consumer<AuthProvider>(
                      builder: (context, auth, _) => GestureDetector(
                        onTap: () async {
                          auth.setIsLoading(true);
                          if (_key.currentState!.validate()) {
                            await _authController
                                .signUpUser(
                              _nameController.text.trim(),
                              _phoneController.text.trim(),
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                              _addressController.text.trim(),
                              imageURL,
                            )
                                .then((value) {
                              auth.setIsLoading(false);
                              CustomSnackbar.showSnack(
                                context,
                                "Account Created Successfully!!",
                                Colors.green,
                              );
                              Navigator.of(context).pushNamed('login');
                            }).onError((error, stackTrace) {
                              auth.setIsLoading(false);
                              // print("2.2. ${authProvider.isLoading}");
                              CustomSnackbar.showSnack(
                                  context, "Error", Colors.red);
                            });
                          } else {
                            // authProvider.setIsLoading(false);
                            // print("3. ${authProvider.isLoading}");
                            return CustomSnackbar.showSnack(
                              context,
                              'All fields are required!',
                              Colors.red,
                            );
                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            color: ColorConstant.secondaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Consumer<AuthProvider>(
                            builder: (context, auth, _) => Center(
                              child: auth.isLoading
                                  ? LottieBuilder.asset(
                                      'assets/animations/loading.json')
                                  : Text(
                                      "SIGN UP",
                                      style: AppTextStyle.normalText(
                                          color: ColorConstant.primaryColor),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                      top: MediaQuery.of(context).size.height * 0.96,
                      left: MediaQuery.of(context).size.width * 0.03,
                      right: MediaQuery.of(context).size.width * 0.03,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already Have An Account?",
                            style: AppTextStyle.boldText(
                              fontSize: 16,
                              color: ColorConstant.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'login', (route) => false);
                            },
                            child: Text(
                              "Login",
                              style: AppTextStyle.boldText(
                                fontSize: 16,
                                color: ColorConstant.secondaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

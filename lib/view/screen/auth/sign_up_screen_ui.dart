import 'package:catering_service/constant.dart';
import 'package:catering_service/controllers/auth_controller.dart';
import 'package:catering_service/view/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math' as math;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  AuthController _authController = AuthController();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _addressController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  signupUser() async {
    if (_key.currentState!.validate()) {
      await _authController.signUpUser(
        _nameController.text.trim(),
        _phoneController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text.trim(),
        _addressController.text.trim(),
      );
      return CustomSnackbar.showSnack(
        context,
        'Account Created Successfully!!',
        const Color.fromARGB(255, 63, 167, 67),
      );
    } else {
      return CustomSnackbar.showSnack(
        context,
        'All fields are required!',
        Colors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: Stack(
          children: [
            Positioned(
              // top: MediaQuery.of(context).size.height * 0.0,
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
              top: MediaQuery.of(context).size.height * 0.3,
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
            //Email Field
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
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
            //Password Field
            Positioned(
              top: MediaQuery.of(context).size.height * 0.28,
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
              top: MediaQuery.of(context).size.height * 0.36,
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
                  controller: _passwordController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    prefixIcon: const Icon(
                      Iconsax.lock,
                      color: Colors.black,
                    ),
                    suffixIcon: const Icon(Iconsax.eye),
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
            //Confirm Password Field
            Positioned(
              top: MediaQuery.of(context).size.height * 0.52,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  left: MediaQuery.of(context).size.height * 0.02,
                  right: MediaQuery.of(context).size.height * 0.02,
                ),
                child: TextFormField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    prefixIcon: const Icon(
                      Iconsax.lock,
                      color: Colors.black,
                    ),
                    suffixIcon: const Icon(Iconsax.eye),
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
            //Email Field
            Positioned(
              top: MediaQuery.of(context).size.height * 0.62,
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
              top: MediaQuery.of(context).size.height * 0.76,
              left: MediaQuery.of(context).size.width * 0.03,
              right: MediaQuery.of(context).size.width * 0.03,
              child: GestureDetector(
                onTap: () {
                  signupUser();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    color: ColorConstant.secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "SIGN UP",
                      style: AppTextStyle.normalText(
                          color: ColorConstant.primaryColor),
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
    );
  }
}

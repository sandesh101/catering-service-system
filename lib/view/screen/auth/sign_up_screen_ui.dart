import 'package:catering_service/constant.dart';
import 'package:catering_service/view/screen/auth/login_screen_ui.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math' as math;

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            // top: MediaQuery.of(context).size.height * 0.0,
            left: MediaQuery.of(context).size.height * 0.17,
            // right: 0,
            bottom: MediaQuery.of(context).size.height * 0.4,
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
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.66,
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
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
    );
  }
}

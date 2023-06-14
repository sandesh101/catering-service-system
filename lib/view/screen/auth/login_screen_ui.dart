import 'package:catering_service/constant.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math' as math;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.06,
            left: 0,
            right: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.5,
              child: const Image(
                image: AssetImage("assets/images/logo.png"),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.42,
            left: MediaQuery.of(context).size.width * 0.05,
            right: 0,
            child: Text(
              'LOGIN',
              style: AppTextStyle.normalText(fontSize: 24),
            ),
          ),
          //Email Field
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
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                  prefixIcon: const Icon(Icons.mail_outline),
                  // prefixIconColor: Constant.secondaryColor,
                  label: Text(
                    "Email ID",
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
          Positioned(
            top: MediaQuery.of(context).size.height * 0.62,
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
            child: Transform.rotate(
              angle: -22 * (math.pi / 180),
              child: const Opacity(
                opacity: 0.5,
                child: Image(
                  image: AssetImage('assets/images/naan.png'),
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
                  "LOGIN",
                  style: AppTextStyle.normalText(
                      color: ColorConstant.primaryColor),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.74,
            left: MediaQuery.of(context).size.width * 0.03,
            right: MediaQuery.of(context).size.width * 0.03,
            child: Center(
              child: Text(
                "Forgot Password?",
                style: AppTextStyle.boldText(
                  fontSize: 16,
                  color: ColorConstant.secondaryColor,
                  fontWeight: FontWeight.w500,
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
                    "Don't Have An Account?",
                    style: AppTextStyle.boldText(
                      fontSize: 16,
                      color: ColorConstant.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Text(
                    "Sign Up",
                    style: AppTextStyle.boldText(
                      fontSize: 16,
                      color: ColorConstant.secondaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

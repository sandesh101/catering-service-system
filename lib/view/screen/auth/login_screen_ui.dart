import 'package:catering_service/constant.dart';
import 'package:catering_service/controllers/auth_controller.dart';
import 'package:catering_service/provider/auth_provider.dart';
import 'package:catering_service/view/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController _authController = AuthController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AuthProvider>(context, listen: false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
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
                    controller: _emailController,
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
                  child: Consumer<AuthProvider>(
                    builder: (context, value, child) => TextFormField(
                      controller: _passwordController,
                      obscureText: value.isLoginPassword,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                        prefixIcon: const Icon(
                          Iconsax.lock,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            value.setIsLoginPassword();
                            // print(value.isPassword);
                          },
                          icon: Icon(
                            value.isLoginPassword
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
                child: Consumer<AuthProvider>(
                  builder: (context, value, child) => GestureDetector(
                    onTap: () async {
                      value.setIsLoading(true);
                      String result = await _authController.loginUser(
                          _emailController.text.trim(),
                          _passwordController.text.trim());

                      if (result == "success") {
                        value.setIsLoading(false);
                        // ignore: use_build_context_synchronously
                        CustomSnackbar.showSnack(
                            context, "Login Success!!", Colors.green);
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamedAndRemoveUntil(
                            context, 'home_master', (route) => false);
                      } else {
                        value.setIsLoading(false);
                        // ignore: use_build_context_synchronously
                        return CustomSnackbar.showSnack(
                            context, result, Colors.red);
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        color: ColorConstant.secondaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Consumer<AuthProvider>(
                          builder: (context, auth, _) => auth.isLoading
                              ? Lottie.asset('assets/animations/loading.json')
                              : Text(
                                  "LOGIN",
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'signup', (route) => false);
                        },
                        child: Text(
                          "Sign Up",
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
    );
  }
}

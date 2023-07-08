import 'package:catering_service/constant.dart';
import 'package:catering_service/view/widgets/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(150),
                    bottomRight: Radius.circular(150),
                  ),
                  color: ColorConstant.secondaryColor),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/samosa.png'),
                ),
                Text(
                  'Sandesh Rimal',
                  style: AppTextStyle.normalText(fontSize: 20),
                ),
                Text(
                  'sandesh@gmail.com',
                  style: AppTextStyle.normalText(
                    fontSize: 12,
                    color: ColorConstant.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.33,
              left: MediaQuery.of(context).size.width * 0.04,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Iconsax.home,
                          size: 25,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Text(
                          "Home",
                          style: AppTextStyle.normalText(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _auth.signOut().then((value) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, "login", (route) => false);
                      }).onError((error, stackTrace) {
                        CustomSnackbar.showSnack(
                            context, error.toString(), Colors.red);
                      });
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Iconsax.logout,
                          size: 25,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        Text(
                          "Logout",
                          style: AppTextStyle.normalText(fontSize: 20),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

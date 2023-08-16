import 'package:catering_service/constant.dart';
import 'package:catering_service/provider/auth_provider.dart';
import 'package:catering_service/provider/cart_provider.dart';
import 'package:catering_service/provider/image_picker_provider.dart';
import 'package:catering_service/provider/product_provider.dart';
import 'package:catering_service/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<ImagePickerProvider>(
            create: (_) => ImagePickerProvider()),
        ChangeNotifierProvider<ProductProvider>(
            create: (_) => ProductProvider()),
        ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HotCase',
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            backgroundColor: ColorConstant.blackColor,
            titleTextStyle: AppTextStyle.normalText(
              fontSize: 20,
              color: ColorConstant.primaryColor,
            ),
          ),
        ),
        initialRoute: "/",
        routes: routeScreen,
      ),
    );
  }
}

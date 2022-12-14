import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_authentication/onBoarding_screen.dart';
import 'auth_controller.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Authentication',
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      home: const OnBoardingScreen(),
    );
  }
}

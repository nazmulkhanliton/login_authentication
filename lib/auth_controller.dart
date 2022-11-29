import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_authentication/welcome_page.dart';
import 'onboarding_screen.dart';


class AuthController extends GetxController{
  //AuthController.instance....
  static AuthController instance = Get.find();

  //email, password, name.....
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    //our user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);

  }
  _initialScreen(User? user){
    if(user==null){
      print("Login Page Test");
      Get.offAll(()=>const OnBoardingScreen());
    }else{
      Get.offAll(()=> const WelcomePage());
    }
  }

  //Login
  void login(String email, password)async{
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
      print("Auth Try Test");
    }catch(e){
      print("Test catch");
      Get.snackbar("About Login", "Login Message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          "Login Failed Try Another Time",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }
  //LogOut
  void logout()async{
    await auth.signOut();
  }
}
import 'package:flutter/material.dart';
import 'package:login_authentication/auth_controller.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Column(
        children: [
          const Text(
            'This is Welcome Page',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: (){
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const LoginPage()),
              // );
              AuthController.instance.logout();
            },
            child: const Text(
              'LogOut',
              style: TextStyle(

              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'dart:async';
import 'package:book/data/shared_data.dart';
import 'package:book/screens/account_management/login_screen.dart';
import 'package:book/screens/admin/admin_home_screen.dart';
import 'package:book/screens/user/user_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    String id = SharedData.readLogInId();
    Timer(const Duration(milliseconds: 2000), () {
      Get.offAll(() => id == "admin"
          ? const AdminHomeScreen()
          : id == ""
          ? LoginScreen()
          : UserHomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: Text(
          "Book Kart",
          style: TextStyle(
            color: Colors.white,
          ),
          textScaleFactor: 2,
        ),
      ),
    );
  }
}

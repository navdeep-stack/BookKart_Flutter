import 'package:book/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Kart',
      theme: ThemeData(
        primaryColor: Colors.indigo[800],
        secondaryHeaderColor: Colors.grey,
      ),
      home: const SplashScreen(),
    );
  }
}

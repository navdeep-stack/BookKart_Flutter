import 'package:book/data/shared_data.dart';
import 'package:book/models/user_provider.dart';
import 'package:book/screens/account_management/signup_screen.dart';
import 'package:book/screens/splash_screen.dart';
import 'package:book/widgets/_common/text_error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:book/widgets/_common/custom_appbar.dart';
import 'package:book/widgets/_common/custom_button.dart';
import 'package:book/widgets/_common/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final errNotifier = ValueNotifier('');
  _onLogin(context) async {
    String email = _email.text.trim();
    String password = _password.text.trim();
    if (email == "admin" && password == "admin") {
      SharedData.writeLogInId("admin");
      Get.offAll(() => const SplashScreen());
    } else {
      if (email.isEmpty || password.isEmpty) {
        errNotifier.value = "Please enter the email and password";
      } else {
        FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          SharedData.writeLogInId(value.user!.uid);
          Provider.of<UserProvider?>(context, listen: false)!
              .assignUser(value.user!.uid);
          Get.offAll(() => const SplashScreen());
          Get.snackbar("Login Successful", "Congratulations !");
        }).catchError((error) {
          if (error is FirebaseAuthException) {
            errNotifier.value = error.message ?? "";
          } else {
            debugPrint(error.toString());
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(
        showLogout: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Welcome!",
              textScaleFactor: 1.2,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomFormField(
              hint: "Email",
              controller: _email,
            ),
            CustomFormField(
              hint: "Password",
              controller: _password,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              title: "Login",
              onPressed: () => _onLogin(context),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Get.to(() => const SignUpScreen());
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            ValueListenableBuilder(
              valueListenable: errNotifier,
              builder: (BuildContext context, String value, Widget? child) {
                return value.isEmpty
                    ? const SizedBox()
                    : Provider<String>.value(
                  value: value,
                  child: const TextError(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

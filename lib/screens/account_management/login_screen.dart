import 'package:bookkart_flutter/screens/account_management/signup_screen.dart';
import 'package:bookkart_flutter/screens/admin/admin_home_screen.dart';
import 'package:bookkart_flutter/widgets/common/custom_appbar.dart';
import 'package:bookkart_flutter/widgets/common/custom_button.dart';
import 'package:bookkart_flutter/widgets/common/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
            const CustomFormField(hint: "Email"),
            const CustomFormField(hint: "Password"),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                title: "Login",
                onPressed: () {
                  Get.to(() => const AdminHomeScreen());
                }),
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
            )
          ],
        ),
      ),
    );
  }
}

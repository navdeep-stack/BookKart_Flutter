import 'package:bookkart_flutter/screens/account_management/signup_form.dart';
import 'package:bookkart_flutter/widgets/common/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(showAddButton: false, showLogout: false),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: SignInButton(
              Buttons.Email,
              text: "Sign up with Email",
              onPressed: () {
                Get.to(() => const SignUpForm());
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SignInButton(
              Buttons.GoogleDark,
              text: "Sign up with Google",
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SignInButton(
              Buttons.FacebookNew,
              text: "Sign up with Facebook",
              onPressed: () {},
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Have an account?",
              ),
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

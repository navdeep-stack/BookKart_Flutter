import 'package:book/screens/account_management/signup_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:book/widgets/_common/custom_appbar.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  _handleGoogleSignIn() {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    _googleSignIn.signIn().then((value) {
      Get.to(() => SignUpForm(
        googleAccount: value,
      ));
    });
  }

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
                Get.to(() => SignUpForm());
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
              onPressed: _handleGoogleSignIn,
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

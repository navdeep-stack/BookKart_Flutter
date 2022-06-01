import 'package:book/models/user_provider.dart';
import 'package:book/widgets/_common/text_error.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:book/data/shared_data.dart';
import 'package:book/models/user_model.dart';
import 'package:book/screens/splash_screen.dart';
import 'package:book/widgets/_common/custom_appbar.dart';
import 'package:book/widgets/_common/custom_button.dart';
import 'package:book/widgets/_common/custom_text_field.dart';

class SignUpForm extends StatelessWidget {
  final GoogleSignInAccount? googleAccount;
  SignUpForm({
    Key? key,
    this.googleAccount,
  }) : super(key: key) {
    _email = TextEditingController(text: googleAccount?.email ?? "");
    _name = TextEditingController(text: googleAccount?.displayName ?? "");
  }
  late TextEditingController _email;
  final TextEditingController _password = TextEditingController();
  late TextEditingController _name;
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _address = TextEditingController();

  final errNotifier = ValueNotifier('');
  _onRegister(context) async {
    String email = _email.text.trim();
    String password = _password.text.trim();
    String confirmPassword = _confirmPassword.text.trim();
    String name = _name.text.trim();
    String address = _address.text.trim();
    String phoneNumber = _phoneNumber.text.trim();
    if (email.isEmpty ||
        password.isEmpty ||
        name.isEmpty ||
        !(email.isEmail) ||
        phoneNumber.isEmpty ||
        address.isEmpty) {
      errNotifier.value = "Please enter all the values";
    } else if (password != confirmPassword) {
      errNotifier.value = "password and confirm password needs to be same";
    } else {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        final _user = UserModel(
          name: name,
          address: address,
          email: email,
          phoneNumber: phoneNumber,
          id: value.user!.uid,
          favouriteBooks: [],
        ).toJson();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(value.user!.uid)
            .set(_user);
        SharedData.writeLogInId(value.user!.uid);
        Get.offAll(() => const SplashScreen());
        Provider.of<UserProvider?>(context, listen: false)!
            .assignUser(value.user!.uid);
        Get.snackbar("Register Successful", "Congratulations !");
      }).catchError((error) {
        if (error is FirebaseAuthException) {
          errNotifier.value = error.message ?? "";
        }
      });
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Sign Up!",
                textScaleFactor: 1.2,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormField(
                hint: "Name",
                controller: _name,
              ),
              CustomFormField(
                hint: "Email",
                controller: _email,
              ),
              CustomFormField(
                hint: "Phone No",
                controller: _phoneNumber,
              ),
              CustomFormField(
                hint: "Address",
                controller: _address,
              ),
              CustomFormField(
                hint: "Password",
                controller: _password,
              ),
              CustomFormField(
                hint: "Confirm Password",
                controller: _confirmPassword,
              ),
              const SizedBox(height: 10),
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
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  title: "Sign Up", onPressed: () => _onRegister(context)),
              const SizedBox(height: 20),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

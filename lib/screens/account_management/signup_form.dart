import 'package:bookkart_flutter/screens/user/user_home_screen.dart';
import 'package:bookkart_flutter/widgets/common/custom_appbar.dart';
import 'package:bookkart_flutter/widgets/common/custom_button.dart';
import 'package:bookkart_flutter/widgets/common/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

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
              const CustomFormField(hint: "Name"),
              const CustomFormField(hint: "Email"),
              const CustomFormField(hint: "Phone No"),
              const CustomFormField(hint: "Address"),
              const CustomFormField(hint: "Password"),
              const CustomFormField(hint: "Confirm Password"),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  title: "Sign Up",
                  onPressed: () {
                    Get.to(() => UserHomeScreen());
                  }),
              const SizedBox(
                height: 20,
              ),
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

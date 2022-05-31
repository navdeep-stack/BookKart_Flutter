import 'package:book/data/shared_data.dart';
import 'package:book/models/user_model.dart';
import 'package:book/models/user_provider.dart';
import 'package:book/screens/account_management/login_screen.dart';
import 'package:book/widgets/_common/custom_button.dart';
import 'package:book/widgets/_common/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, user, child) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomFormField(enabled: false, hint: user.user?.name ?? "N/A"),
            CustomFormField(enabled: false, hint: user.user?.email ?? "N/A"),
            // const CustomFormField(hint: "India"),
            const Spacer(),
            CustomButton(
                title: "Sign Out",
                onPressed: () {
                  SharedData.logout();
                  Get.offAll(() => LoginScreen());
                })
          ],
        ),
      );
    });
  }
}

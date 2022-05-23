
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CustomFormField(hint: "User"),
          const CustomFormField(hint: "User@test.com"),
          const CustomFormField(hint: "India"),
          const Spacer(),
          CustomButton(
              title: "Sign Out",
              onPressed: () {
                Get.back();
              })
        ],
      ),
    );
  }
}

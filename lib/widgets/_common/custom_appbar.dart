import 'package:book/data/shared_data.dart';
import 'package:book/screens/account_management/login_screen.dart';
import 'package:book/screens/admin/book_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar {
  static appBar({
    bool showAddButton = false,
    bool showLogout = true,
  }) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: showAddButton
          ? IconButton(
        onPressed: () {
          Get.to(() => BookForm());
        },
        icon: const Icon(Icons.add_circle, color: Colors.blue),
      )
          : null,
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        "Book Kart",
        style: TextStyle(
          color: Theme.of(Get.context!).primaryColor,
        ),
        textScaleFactor: 1.2,
      ),
      actions: [
        showLogout
            ? InkWell(
          onTap: () {
            SharedData.logout();
            Get.offAll(LoginScreen());
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        )
            : const SizedBox(),
      ],
    );
  }
}

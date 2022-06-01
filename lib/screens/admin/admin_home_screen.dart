import 'package:book/widgets/books/book_list_view_builder.dart';
import 'package:book/widgets/_common/custom_appbar.dart';
import 'package:book/widgets/_common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'admin_orders_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(showAddButton: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButton(
              title: "View Orders",
              onPressed: () {
                Get.to(() => const AdminOrders());
              }),
          const SizedBox(
            height: 10,
          ),
          const Expanded(
            child: BookListViewBuilder(
              isAdmin: true,
            ),
          ),
        ],
      ),
    );
  }
}

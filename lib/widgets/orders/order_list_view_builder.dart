import 'package:book/models/book_model.dart';
import 'package:book/models/order_model.dart';
import 'package:book/models/user_provider.dart';
import 'package:book/widgets/books/book_list_tile.dart';
import 'package:book/widgets/orders/order_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderListViewBuilder extends StatelessWidget {
  final bool isAdmin;

  const OrderListViewBuilder({
    Key? key,
    this.isAdmin = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<OrderModel>>(context);
    final user = Provider.of<UserProvider>(context);

    var tempOrders = [];

    if (!isAdmin) {
      tempOrders = [...orders.where((e) => e.customerId == user.user!.id)];
    } else {
      tempOrders = orders;
    }

    return tempOrders.isEmpty
        ? const Center(
      child: Text("No Orders"),
    )
        : ListView.builder(
      itemCount: tempOrders.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return OrderListTile(
          orderModel: tempOrders[index],
          isAdmin: isAdmin,
        );
      },
    );
  }
}

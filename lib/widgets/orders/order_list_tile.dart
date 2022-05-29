import 'dart:math';

import 'package:book/models/order_model.dart';
import 'package:flutter/material.dart';

class OrderListTile extends StatelessWidget {
  final OrderModel orderModel;
  final bool isAdmin;
  const OrderListTile({
    Key? key,
    required this.orderModel,
    this.isAdmin = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
        tileColor: Colors.white,
        title: Text("Order #${orderModel.id}"),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...orderModel.books!.map(
              (e) => Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Text("1 X " + e.keys.first + "\$${e.values.first}"),
              ),
            ),
            !isAdmin
                ? Text("Order Delivery Date :- " +
                    DateTime.now()
                        .add(Duration(days: Random().nextInt(10)))
                        .toString()
                        .substring(0, 19))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Customer Details"),
                      const SizedBox(height: 10),
                      Text("Name: " + orderModel.customerName!),
                      Text("Address: " + orderModel.customerAddress!),
                      Text("Number: " + orderModel.customerNumber!),
                    ],
                  )
          ],
        ),
        trailing: Text("\$ ${orderModel.orderAmount!.toStringAsFixed(2)}"),
      ),
    );
  }
}

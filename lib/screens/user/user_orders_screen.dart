import 'package:book/widgets/orders/order_list_view_builder.dart';
import 'package:flutter/material.dart';

class UserOrders extends StatelessWidget {
  const UserOrders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: OrderListViewBuilder(),
    );
  }
}

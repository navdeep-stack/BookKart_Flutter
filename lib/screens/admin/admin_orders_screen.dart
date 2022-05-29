import 'package:book/widgets/orders/order_list_view_builder.dart';
import 'package:flutter/material.dart';

import '../../widgets/common/custom_appbar.dart';

class AdminOrders extends StatelessWidget {
  const AdminOrders({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: OrderListViewBuilder(
          isAdmin: true,
        ),
      ),
    );
  }
}

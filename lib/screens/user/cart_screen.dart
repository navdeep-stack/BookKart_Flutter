
import 'package:flutter/material.dart';

import '../../widgets/books/book_cart_view.dart';
import '../../widgets/cart/price_total_view.dart';
import '../../widgets/common/custom_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildCartProducts(),
              const SizedBox(height: 20),
              _buildPricingSection(),
              const SizedBox(height: 20),
              CustomButton(title: "Proceed to Checkout", onPressed: () {}),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  _buildCartProducts() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return const BookCartView();
      },
    );
  }

  _buildPricingSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        PricetotalView(title: "Cart Total", price: 28),
        PricetotalView(title: "Tax", price: 5),
        PricetotalView(title: "Delivery", price: 5),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            height: 2,
            thickness: 2,
          ),
        ),
        PricetotalView(title: "Subtotal", price: 34),
      ],
    );
  }
}

import 'package:book/models/cart_model.dart';
import 'package:book/widgets/books/book_cart_view.dart';
import 'package:book/widgets/cart/price_total_view.dart';
import 'package:book/widgets/_common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartNotifier cart = Provider.of<CartNotifier>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: cart.totalPrice == 0
            ? const Center(
          child: Text("No Items added"),
        )
            : SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildCartProducts(cart),
              const SizedBox(height: 20),
              _buildPricingSection(cart),
              const SizedBox(height: 20),
              CustomButton(
                  title: "Proceed to Checkout",
                  onPressed: () {
                    Get.snackbar("Order", "Placed Successfully");
                    cart.clear(context);
                  }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  _buildCartProducts(cart) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: cart.books.length,
      itemBuilder: (BuildContext context, int index) {
        return BookCartView(
          book: cart.books[index],
        );
      },
    );
  }

  _buildPricingSection(CartNotifier cart) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PricetotalView(title: "Cart Total", price: cart.totalPrice.toDouble()),
        const PricetotalView(title: "Tax", price: 5),
        const PricetotalView(title: "Delivery", price: 5),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            height: 2,
            thickness: 2,
          ),
        ),
        PricetotalView(
            title: "Subtotal", price: (cart.totalPrice + 10).toDouble()),
      ],
    );
  }
}

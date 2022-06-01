import 'package:flutter/material.dart';

class PricetotalView extends StatelessWidget {
  final String title;
  final double price;

  const PricetotalView({Key? key, required this.title, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 2, bottom: 2),
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          Text("\$${price.toStringAsFixed(2)}"),
        ],
      ),
    );
  }
}

import 'package:book/models/book_model.dart';
import 'package:book/models/cart_model.dart';
import 'package:book/widgets/_common/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookCartView extends StatelessWidget {
  final BookModel book;
  const BookCartView({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            book.imageURL ??
                "https://uploads-ssl.webflow.com/5f64a4eb5a48d21969aa774a/60ad9c51cec4bde78070db36_the_psychology_of_money.jpeg",
            height: 100,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        book.bookName ?? "The Psychology of Money",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "\$${book.price!.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1.2,
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  book.categoryName!,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                  textScaleFactor: 1.2,
                ),
                const SizedBox(
                  height: 10,
                ),
                _buildRemoveAddedButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildRemoveAddedButton(context) {
    return Consumer<CartNotifier>(builder: (context, cart, child) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButton(
            title: "REMOVE",
            onPressed: () {
              cart.remove(book);
            },
            color: Colors.red,
          ),
        ],
      );
    });
  }
}

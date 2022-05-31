import 'package:book/models/book_model.dart';
import 'package:book/models/cart_model.dart';
import 'package:book/models/user_model.dart';
import 'package:book/models/user_provider.dart';
import 'package:book/screens/admin/book_form.dart';
import 'package:book/widgets/_common/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class BookListTile extends StatelessWidget {
  final BookModel book;
  final bool isAdmin;
  const BookListTile({
    Key? key,
    this.isAdmin = false,
    required this.book,
  }) : super(key: key);

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
            height: 150,
            width: 100,
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
                        book.bookName!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1.2,
                      ),
                    ),
                    isAdmin
                        ? const SizedBox()
                        : Consumer<UserProvider>(
                        builder: (context, user, child) {
                          return InkWell(
                            onTap: () {
                              user.addOrRemoveAFavouriteBook(
                                  bookID: book.id!);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ((user.user!.favouriteBooks ?? [])
                                  .contains(book.id))
                                  ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                                  : const Icon(
                                Icons.favorite_outline,
                                color: Colors.grey,
                              ),
                            ),
                          );
                        }),
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
                !isAdmin
                    ? const SizedBox(
                  height: 10,
                )
                    : const SizedBox(),
                !isAdmin
                    ? Text(
                  "\$${book.price!.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 1.2,
                )
                    : const SizedBox(),
                SizedBox(
                  height: isAdmin ? 50 : 10,
                ),
                isAdmin ? _buildEditDeleteButtons() : _buildAddToCartButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildEditDeleteButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomButton(
          title: "Delete",
          onPressed: () {
            FirebaseFirestore.instance
                .collection("books")
                .doc(book.id)
                .delete();
          },
          color: Colors.red,
        ),
        const SizedBox(
          width: 10,
        ),
        CustomButton(
            title: "Edit",
            onPressed: () {
              Get.to(
                    () => BookForm(
                  book: book,
                ),
              );
            },
            color: Theme.of(Get.context!).primaryColor),
      ],
    );
  }

  _buildAddToCartButton() {
    return Consumer<CartNotifier?>(builder: (context, value, child) {
      final _cart = Provider.of<CartNotifier?>(context);
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _cart?.isInCart(book) ?? false
              ? CustomButton(
            title: "Remove",
            onPressed: () => _cart!.remove(book),
            color: Colors.red,
          )
              : CustomButton(
            title: "Add",
            onPressed: () => _cart!.add(book),
            color: Theme.of(Get.context!).primaryColor,
          ),
        ],
      );
    });
  }
}

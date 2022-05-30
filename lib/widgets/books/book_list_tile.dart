import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/admin/book_form.dart';
import '../_common/custom_button.dart';

class BookListTile extends StatelessWidget {
  final bool isAdmin;
  const BookListTile({Key? key, this.isAdmin = false}) : super(key: key);

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
            "https://uploads-ssl.webflow.com/5f64a4eb5a48d21969aa774a/60ad9c51cec4bde78070db36_the_psychology_of_money.jpeg",
            height: 150,
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
                    const Flexible(
                      child: Text(
                        "The Psychology of Money",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1.2,
                      ),
                    ),
                    isAdmin
                        ? const SizedBox()
                        : const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.grey,
                            ),
                          ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "8 September 2020",
                  style: TextStyle(
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
                    ? const Text(
                        "\$14",
                        style: TextStyle(
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
          onPressed: () {},
          color: Colors.red,
        ),
        const SizedBox(
          width: 10,
        ),
        CustomButton(
            title: "Edit",
            onPressed: () {
              Get.to(
                () => const BookForm(
                  // edit: true,
                ),
              );
            },
            color: Theme.of(Get.context!).primaryColor),
      ],
    );
  }

  _buildAddToCartButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomButton(
          title: "Add",
          onPressed: () {},
          color: Theme.of(Get.context!).primaryColor,
        ),
      ],
    );
  }
}

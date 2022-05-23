import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/custom_button.dart';

class BookCartView extends StatelessWidget {
  const BookCartView({Key? key}) : super(key: key);

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
                  children: const [
                    Flexible(
                      child: Text(
                        "The Psychology of Money",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 1,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\$14",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1.2,
                    )
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
                const SizedBox(
                  height: 10,
                ),
                _buildRemoveAddedButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildRemoveAddedButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomButton(
          title: "REMOVE",
          onPressed: () {},
          color: Colors.red,
        ),
        const SizedBox(
          width: 10,
        ),
        CustomButton(
            title: "ADDED",
            onPressed: () {},
            color: Theme.of(Get.context!).primaryColor),
      ],
    );
  }
}

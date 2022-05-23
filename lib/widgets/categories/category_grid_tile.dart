import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/user/book_list_page.dart';

class CategoryGridTile extends StatelessWidget {
  const CategoryGridTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => const BookListPage());
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/3310/3310624.png",
                height: 100,
              ),
            ),
            const Spacer(),
            const Text(
              "Crime and Thriller",
              textScaleFactor: 1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../widgets/books/book_list_view_builder.dart';
import '../../widgets/books/search_field.dart';
import '../../widgets/_common/custom_appbar.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(
        showLogout: false,
        showAddButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchField(),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  "Business & Economics",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                _buildDropDown(),
              ],
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: BookListViewBuilder(),
            ),
          ],
        ),
      ),
    );
  }

  _buildDropDown() {
    return Flexible(
      // width: 30,
      child: DropdownButton(
        hint: const Text(
          "Sorting",
          textScaleFactor: 0.9,
        ),
        items: const [
          DropdownMenuItem(
            child: Text("Price: High to Low"),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text("Price: Low to High"),
            value: 2,
          ),
        ],
        onChanged: (v) {},
      ),
    );
  }
}

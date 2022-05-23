
import 'package:flutter/material.dart';

import '../../widgets/books/book_list_view_builder.dart';
import '../../widgets/books/search_field.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SearchField(),
            SizedBox(height: 20),
            Expanded(
              child: BookListViewBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}

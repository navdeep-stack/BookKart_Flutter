import 'package:book/widgets/_common/custom_appbar.dart';
import 'package:book/widgets/books/book_list_view_builder.dart';
import 'package:book/widgets/books/search_field.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key}) : super(key: key);
  final ValueNotifier _search = ValueNotifier("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(
              onChanged: (String? t) {
                _search.value = t;
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _search,
                builder: (BuildContext context, dynamic search, Widget? child) {
                  return BookListViewBuilder(
                    search: search ?? "",
                    onlyFavourites: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

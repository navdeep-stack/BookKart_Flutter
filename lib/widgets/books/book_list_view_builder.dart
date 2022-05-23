import 'package:flutter/material.dart';
import 'book_list_tile.dart';

class BookListViewBuilder extends StatelessWidget {
  final bool isAdmin;
  const BookListViewBuilder({Key? key, this.isAdmin = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return BookListTile(isAdmin: isAdmin);
      },
    );
  }
}

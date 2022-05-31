import 'package:book/models/book_model.dart';
import 'package:book/models/user_provider.dart';
import 'package:book/widgets/books/book_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookListViewBuilder extends StatelessWidget {
  final bool isAdmin;
  final bool onlyFavourites;
  final int sortTechnique;
  final String search;
  final String category;
  const BookListViewBuilder({
    Key? key,
    this.isAdmin = false,
    this.onlyFavourites = false,
    this.sortTechnique = 0,
    this.search = "",
    this.category = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final books = Provider.of<List<BookModel>>(context);
    final user = Provider.of<UserProvider>(context);

    if (sortTechnique != 0) {
      if (sortTechnique == 1) {
        books.sort((b, a) => (a.price!.compareTo(b.price!)));
      } else {
        books.sort((a, b) => (a.price!.compareTo(b.price!)));
      }
    }

    var tempBooks = [];
    if (onlyFavourites) {
      tempBooks = books
          .where((element) => (user.user!.favouriteBooks!.contains(element.id)))
          .toList();
    }
    return books.isEmpty
        ? const Center(
      child: Text("No Books"),
    )
        : onlyFavourites
        ? ListView.builder(
      itemCount: tempBooks.length,
      itemBuilder: (BuildContext context, int index) {
        return ((search.isEmpty ||
            tempBooks[index]
                .bookName!
                .toLowerCase()
                .contains(search.toLowerCase())) &&
            (category.isEmpty ||
                tempBooks[index].categoryName! == category))
            ? BookListTile(
          isAdmin: isAdmin,
          book: tempBooks[index],
        )
            : const SizedBox();
      },
    )
        : ListView.builder(
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        return ((search.isEmpty ||
            books[index]
                .bookName!
                .toLowerCase()
                .contains(search.toLowerCase())) &&
            (category.isEmpty ||
                books[index].categoryName! == category))
            ? BookListTile(
          isAdmin: isAdmin,
          book: books[index],
        )
            : const SizedBox();
      },
    );
  }
}

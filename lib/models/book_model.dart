import 'package:cloud_firestore/cloud_firestore.dart';

class BookModel {
  String? imageURL;
  num? price;
  String? bookName;
  String? categoryName;

  String? id;

  BookModel({
    this.imageURL,
    this.price,
    this.bookName,
    this.categoryName,
    this.id,
  });

  BookModel.fromJson(DocumentSnapshot data) {
    final json = data.data() as Map;
    imageURL = json['imageURL'];
    price = json['price'];
    bookName = json['book_name'];
    categoryName = json['category_name'];
    id = data.id;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['imageURL'] = imageURL;
    data['price'] = price;
    data['book_name'] = bookName;
    data['category_name'] = categoryName;
    return data;
  }

  @override
  bool operator ==(other) => other is BookModel && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

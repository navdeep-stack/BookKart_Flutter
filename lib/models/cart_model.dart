import 'package:book/models/book_model.dart';
import 'package:book/models/order_model.dart';
import 'package:book/models/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartNotifier extends ChangeNotifier {
  final Set<BookModel> _cartItems = {};

  List<BookModel> get books => _cartItems.toList();

  void remove(BookModel item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  void add(BookModel item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void clear(context) {
    UserProvider user = Provider.of<UserProvider>(context, listen: false);
    OrderModel order = OrderModel(
      books: [
        ...books.map((e) => {e.bookName!: e.price!})
      ],
      customerAddress: user.user!.address ?? "",
      customerName: user.user!.name ?? "",
      customerNumber: user.user!.phoneNumber,
      orderAmount: totalPrice,
      customerId: user.user!.id,
    );
    FirebaseFirestore.instance.collection("orders").add(order.toJson());
    _cartItems.clear();
    notifyListeners();
  }

  bool isInCart(BookModel item) {
    return _cartItems.contains(item);
  }

  num get totalPrice {
    return _cartItems.fold(
        0.0, (previousValue, element) => previousValue + element.price!);
  }
}

import 'package:book/models/book_model.dart';
import 'package:book/models/order_model.dart';
import 'package:book/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataStreams {
  static Stream<List<BookModel>> books() {
    return FirebaseFirestore.instance
        .collection("books")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((e) => BookModel.fromJson(e)).toList();
    });
  }

  static Stream<List<OrderModel>> userOrders() {
    return FirebaseFirestore.instance
        .collection("orders")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((e) => OrderModel.fromJson(e)).toList();
    });
  }

  static Stream<UserModel> userDataStream({required String userId}) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .snapshots()
        .map((snapshot) {
      return UserModel.fromJson(snapshot);
    });
  }
}

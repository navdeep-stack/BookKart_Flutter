import 'package:book/data/streams.dart';
import 'package:book/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  late UserModel? _user;
  UserModel? get user => _user;

  Future<void> assignUser(String userId) async {
    if (userId.isEmpty) {
      _user = null;
    } else {
      _user = await DataStreams.userDataStream(userId: userId).first;
    }
    notifyListeners();
  }

  void addOrRemoveAFavouriteBook({required String bookID}) async {
    if (_user!.favouriteBooks!.contains(bookID)) {
      _user!.favouriteBooks!.remove(bookID);
    } else {
      _user!.favouriteBooks!.add(bookID);
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_user!.id)
        .update({"favourite_books": _user!.favouriteBooks});
    notifyListeners();
  }
}

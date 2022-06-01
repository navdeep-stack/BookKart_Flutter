import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  String? id;
  List<dynamic>? favouriteBooks;
  UserModel({
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
    this.id,
    this.favouriteBooks,
  });

  UserModel.fromJson(DocumentSnapshot data) {
    final json = data.data() as Map;
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    id = data.id;
    favouriteBooks = json['favourite_books'] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['address'] = address;
    data['favourite_books'] = favouriteBooks;
    return data;
  }

  @override
  bool operator ==(other) => other is UserModel && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

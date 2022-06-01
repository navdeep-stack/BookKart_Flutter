import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String? customerName;
  num? orderAmount;
  String? customerNumber;
  String? customerId;
  List<dynamic>? books;
  String? customerAddress;
  String? id;

  OrderModel({
    this.customerName,
    this.orderAmount,
    this.customerNumber,
    this.customerId,
    this.customerAddress,
    this.id,
    this.books,
  });

  OrderModel.fromJson(DocumentSnapshot data) {
    final json = data.data() as Map;
    customerName = json['customer_name'];
    customerId = json['customer_id'];
    orderAmount = json['order_amount'];
    customerNumber = json['phone_number'];
    customerAddress = json['customer_address'];
    books = json['books'];
    id = data.id;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['customer_name'] = customerName;
    data['customer_id'] = customerId;
    data['order_amount'] = orderAmount;
    data['phone_number'] = customerNumber;
    data['customer_address'] = customerAddress;
    data['books'] = books;
    return data;
  }

  @override
  bool operator ==(other) => other is OrderModel && other.id == id;

  @override
  int get hashCode => id.hashCode;
}

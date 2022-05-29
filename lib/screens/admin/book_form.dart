import 'dart:io';

import 'package:book/data/constants.dart';
import 'package:book/data/image_upload_helper.dart';
import 'package:book/models/book_model.dart';
import 'package:book/widgets/common/custom_appbar.dart';
import 'package:book/widgets/common/custom_button.dart';
import 'package:book/widgets/common/custom_text_field.dart';
import 'package:book/widgets/common/image_upload_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class BookForm extends StatefulWidget {
  final BookModel? book;

  const BookForm({Key? key, this.book}) : super(key: key);
  @override
  State<BookForm> createState() => _BookFormState();
}

class _BookFormState extends State<BookForm> {
  final ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<XFile?> _bookImage = ValueNotifier(null);
  late TextEditingController _bookName;

  late TextEditingController _bookCategory;

  late TextEditingController _bookPrice;

  @override
  void initState() {
    super.initState();

    _bookName = TextEditingController(
      text: widget.book?.bookName,
    );
    _bookCategory = TextEditingController(
      text: widget.book?.categoryName,
    );
    _bookPrice = TextEditingController(
      text: widget.book?.price.toString(),
    );
  }

  _handleBookAddEdit() async {
    _isLoading.value = true;
    String imageUrl = "";
    if (_bookImage.value != null) {
      imageUrl = await ImageUploadHelper()
          .uploadImage(imageFile: File(_bookImage.value!.path));
    }
    _isLoading.value = false;
    final bookName = _bookName.text;
    final bookCategory = _bookCategory.text;
    final bookPrice = _bookPrice.text;
    final _book = BookModel(
      bookName: bookName,
      categoryName: bookCategory,
      price: num.tryParse(bookPrice) ?? 0,
      imageURL: imageUrl.isEmpty ? null : imageUrl,
    ).toJson();
    if (widget.book != null) {
      await FirebaseFirestore.instance
          .collection('books')
          .doc(widget.book!.id)
          .update(_book);
    } else {
      await FirebaseFirestore.instance.collection('books').add(_book);
    }
    Get.back();
    Get.snackbar(
      "Book",
      widget.book != null
          ? "Details Saved Successfully"
          : "Book added sucessfully",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.book != null ? "Edit Book Details" : "Add a Book",
              textScaleFactor: 1.4,
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
            const SizedBox(height: 20),
            ImageUploadButton(
              imageNotifier: _bookImage,
              previousImage: widget.book?.imageURL,
            ),
            const SizedBox(height: 20),
            CustomFormField(hint: "Book Name", controller: _bookName),
            CustomFormField(hint: "Price", controller: _bookPrice),
            DropdownButton<String>(
              hint: const Text("Select Book Category"),
              value: _bookCategory.text == "" ? null : _bookCategory.text,
              items: [
                ...bookCategories
                    .map((e) => DropdownMenuItem<String>(
                  child: Text(e),
                  value: e,
                ))
                    .toList()
              ],
              onChanged: (String? v) {
                _bookCategory.text = v ?? "";
                setState(() {});
              },
            ),
            const Spacer(),
            ValueListenableBuilder(
              valueListenable: _isLoading,
              builder: (BuildContext context, dynamic value, Widget? child) {
                return value
                    ? const CupertinoActivityIndicator()
                    : CustomButton(
                  title:
                  widget.book != null ? "Update Details" : "Add Book",
                  onPressed: _handleBookAddEdit,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

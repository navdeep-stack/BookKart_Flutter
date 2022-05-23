import 'package:flutter/material.dart';

import '../../widgets/common/custom_appbar.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';

class BookForm extends StatelessWidget {
  final bool edit;
  const BookForm({Key? key, this.edit = false}) : super(key: key);

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
              edit ? "Edit Book Details" : "Add a Book",
              textScaleFactor: 1.4,
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
              ),
            ),
            const SizedBox(height: 20),
            const CustomFormField(hint: "Book Name"),
            const CustomFormField(hint: "Category"),
            const CustomFormField(hint: "Price"),
            const Spacer(),
            CustomButton(
              title: edit ? "Update Details" : "Add Book",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

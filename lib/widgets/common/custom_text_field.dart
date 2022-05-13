import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hint;
  const CustomFormField({
    Key? key,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(top: 2, bottom: 2, left: 8, right: 8), 
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

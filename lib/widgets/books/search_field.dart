import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String hint;
  final Function(String?)? onChanged;
  final TextEditingController? controller;
  const SearchField(
      {Key? key,
        this.hint = "Search Items...",
        this.controller,
        this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

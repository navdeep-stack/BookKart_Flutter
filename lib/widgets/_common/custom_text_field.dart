import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final bool? enabled;
  const CustomFormField({
    Key? key,
    required this.hint,
    this.enabled,
    this.controller,
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
        controller: controller,
        enabled: enabled ?? true,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

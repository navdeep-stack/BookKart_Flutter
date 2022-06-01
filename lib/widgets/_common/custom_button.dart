import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Color? color;

  const CustomButton(
      {Key? key, required this.title, required this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Theme.of(Get.context!).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        constraints: const BoxConstraints(
          minWidth: 80,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
            textScaleFactor: 1.2,
          ),
        ),
        padding: const EdgeInsets.all(8),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextError extends StatelessWidget {
  const TextError({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<String>(context);
    return Container(
      width: double.infinity,
      color: Colors.red,
      padding: const EdgeInsets.all(10),
      child: Text(
        value,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

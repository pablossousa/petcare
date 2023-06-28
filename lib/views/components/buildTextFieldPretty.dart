import 'package:flutter/material.dart';

Padding buildTextFieldPretty(BuildContext context, TextEditingController controller, TextInputType keyboard, String? erroMessage) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextField(
      controller: controller,
      keyboardType: keyboard,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
          ),
          errorText: erroMessage
      ),
    ),
  );
}
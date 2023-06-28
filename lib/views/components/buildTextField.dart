import 'package:flutter/material.dart';

TextField buildTextField(BuildContext context, TextEditingController controller, TextInputType keyboard, String label, String? errorMessage) {
  return TextField(
    controller: controller,
    keyboardType: keyboard,
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
      errorText: errorMessage,
    ),
  );
}
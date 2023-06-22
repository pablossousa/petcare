import 'package:flutter/material.dart';

void showErrorMessage(BuildContext context, String title, String message) {
  Widget okButton = TextButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    child: const Text('Ok'),
  );

  AlertDialog alerta = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      }
  );
}
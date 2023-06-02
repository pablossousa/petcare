import 'package:flutter/material.dart';

class Anamnese extends StatefulWidget {
  const Anamnese({super.key});

  @override
  State<Anamnese> createState() => _AnamneseState();
}

class _AnamneseState extends State<Anamnese> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anamnese'),
      ),
    );
  }
}
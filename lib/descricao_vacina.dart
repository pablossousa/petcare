import 'package:flutter/material.dart';

class DescricaoVacina extends StatefulWidget {
  const DescricaoVacina({super.key});

  @override
  State<DescricaoVacina> createState() => _DescricaoVacinaState();
}

class _DescricaoVacinaState extends State<DescricaoVacina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informações'),
      ),
    );
  }
}
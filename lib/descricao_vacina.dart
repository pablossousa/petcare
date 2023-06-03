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
      body: const Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 20,
          ),
          Text(
            'Nome da Vacina',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.cyan),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
            'Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently desktop publishing software like Aldus PageMaer including versions of.',
            textAlign: TextAlign.justify,
            ),
          ),
          Text(
            'Períodos e Doses',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.cyan),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(
            'Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently desktop publishing software like Aldus PageMaer including versions of.',
            textAlign: TextAlign.justify,
            ),
          )
        ]
      ),
    );
  }
}
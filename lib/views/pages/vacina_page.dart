import 'package:flutter/material.dart';

import '../../data/database/database.dart';

//ignore: must_be_immutable
class VacinaPage extends StatefulWidget {
  VacinacaoWithVacina? dadosVacina;

  VacinaPage({Key? key, this.dadosVacina}) : super(key: key);

  @override
  State<VacinaPage> createState() => _VacinaPageState();
}

class _VacinaPageState extends State<VacinaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vacina'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              widget.dadosVacina!.vacina.nome,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
            widget.dadosVacina!.vacina.descricao,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            title: const Text(
              'Período e Doses',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              widget.dadosVacina!.vacina.periodoDoses,
              style: const TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}

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
        elevation: 0,
        shadowColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color.fromARGB(255, 68, 132, 140), Color.fromARGB(255, 92, 156, 148), Color.fromARGB(224, 140, 172, 164)]
              )
          ),
        ),
        title: Text(widget.dadosVacina!.vacina.nome),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        children: [
          Text(
            widget.dadosVacina!.vacina.nome,
            style: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 68, 132, 140),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.dadosVacina!.vacina.descricao,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Color.fromARGB(255, 68, 132, 140),
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            "Período e Doses",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 68, 132, 140),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.dadosVacina!.vacina.periodoDoses,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Color.fromARGB(255, 68, 132, 140),
            ),
          ),
        ],
      ),
    );
  }
}

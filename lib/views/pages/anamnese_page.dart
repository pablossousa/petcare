import 'package:flutter/material.dart';

import '../../data/database/database.dart';

//ignore: must_be_immutable
class AnamnesePage extends StatefulWidget {
  Anamnese? dadosAnamnese;

  AnamnesePage({Key? key, this.dadosAnamnese}) : super(key: key);

  @override
  State<AnamnesePage> createState() => _AnamnesePageState();
}

class _AnamnesePageState extends State<AnamnesePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Anamnese dia: ${widget.dadosAnamnese!.cadastro.toString()}'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text(
                'Queixa Principal',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                widget.dadosAnamnese!.queixaPrincipal,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              title: const Text(
                'Alimentação',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                widget.dadosAnamnese!.alimentacao,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              title: const Text(
                'Doenças Anteriores',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                widget.dadosAnamnese!.doencasAnteriores,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              title: const Text(
                'Alergias',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                widget.dadosAnamnese!.alergias,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              title: const Text(
                'Tempo Evolução',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                widget.dadosAnamnese!.tempoEvolucao,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              title: const Text(
                'Tipo Evolução',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                widget.dadosAnamnese!.tipoEvolucao,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              title: const Text(
                'Ambiente ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                widget.dadosAnamnese!.ambiente,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            CheckboxListTile(
                title: const Text(
                  'Fugiu Recentemente',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                value: widget.dadosAnamnese!.fugiuRecentemente,
                activeColor: Colors.cyan,
              onChanged: null,
            ),
            CheckboxListTile(
                title: const Text(
                  'Pulgas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                value: widget.dadosAnamnese!.pulgas,
                activeColor: Colors.cyan,
                onChanged: null,
            ),
            CheckboxListTile(
                title: const Text(
                  'Carrapatos',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                value: widget.dadosAnamnese!.carrapatos,
                activeColor: Colors.cyan,
              onChanged: null,
            ),
            ListTile(
              title: const Text(
                'Vacina',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                widget.dadosAnamnese!.vacina,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            ListTile(
              title: const Text(
                'Vermifugação',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                widget.dadosAnamnese!.vermifugaco,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        )
    );
  }
}

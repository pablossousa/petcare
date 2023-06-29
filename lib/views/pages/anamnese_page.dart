import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          title: Text('Anamnese: ${DateFormat('dd/MM/yyyy kk:mm').format(widget.dadosAnamnese!.cadastro).toString()}'),
        ),
        body: ListView(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
          children: [
            const Text(
              "Queixa Principal",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.dadosAnamnese!.queixaPrincipal,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Alimentação",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.dadosAnamnese!.alimentacao,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Doenças Anteriores",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.dadosAnamnese!.doencasAnteriores,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Alergias",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.dadosAnamnese!.alergias,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Tempo de evolução",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.dadosAnamnese!.tempoEvolucao,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Tipo de evolução",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.dadosAnamnese!.tipoEvolucao,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Ambiente",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.dadosAnamnese!.ambiente,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(height: 15),
            CheckboxListTile(
              title: const Text(
                'Fugiu Recentemente',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              ),
              value: widget.dadosAnamnese!.fugiuRecentemente,
              fillColor: MaterialStateColor.resolveWith(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return const Color.fromARGB(255, 68, 132, 140);
                  }
                  return Colors.green;
                }
              ),
              onChanged: null,
            ),
            CheckboxListTile(
              title: const Text(
                'Pulgas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              ),
              value: widget.dadosAnamnese!.pulgas,
              fillColor: MaterialStateColor.resolveWith(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return const Color.fromARGB(255, 68, 132, 140);
                    }
                    return Colors.green;
                  }
              ),
                onChanged: null,
            ),
            CheckboxListTile(
              title: const Text(
                'Carrapatos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              ),
              value: widget.dadosAnamnese!.carrapatos,
              fillColor: MaterialStateColor.resolveWith(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return const Color.fromARGB(255, 68, 132, 140);
                    }
                    return Colors.green;
                  }
              ),
              onChanged: null,
            ),
            const SizedBox(height: 15),
            const Text(
              "Vacinas",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.dadosAnamnese!.vacina,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Vermifugação",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.dadosAnamnese!.vermifugaco,
              style: const TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
          ],
        )
    );
  }
}

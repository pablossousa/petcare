import 'package:flutter/material.dart';

import 'menu.dart';

class CadastroPet extends StatefulWidget {
  const CadastroPet({super.key});

  @override
  State<CadastroPet> createState() => _CadastroPetState();
}

class _CadastroPetState extends State<CadastroPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro do Pet'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (text) {},
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: 'Nome', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextField(
                  onChanged: (text) {},
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Idade', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextField(
                  onChanged: (text) {},
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: 'Espécie', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextField(
                  onChanged: (text) {},
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      labelText: 'Data de nascimento',
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextField(
                  onChanged: (text) {},
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: 'Raça', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextField(
                  onChanged: (text) {},
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Peso', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextField(
                  onChanged: (text) {},
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: 'Sexo', border: OutlineInputBorder()),
                ),
                const SizedBox(height: 15),
                TextField(
                  onChanged: (text) {},
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      labelText: 'Naturalidade', border: OutlineInputBorder()),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => const Menu()),
                        );
                      },
                      child: const Text('Cadastrar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

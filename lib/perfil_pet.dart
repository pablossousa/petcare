import 'package:flutter/material.dart';
import 'package:petcare/anamnese.dart';
import 'package:petcare/cartao_vacina.dart';

class PerfilPet extends StatefulWidget {
  const PerfilPet({super.key});

  @override
  State<PerfilPet> createState() => _PerfilPetState();
}

class _PerfilPetState extends State<PerfilPet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Identidade'),
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text(
              'Nome:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const ListTile(
            title: Text(
              'Sexo:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const ListTile(
            title: Text(
              'Filiação:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const ListTile(
            title: Text(
              'Naturalidade:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const ListTile(
            title: Text(
              'Endereço:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const ListTile(
            title: Text(
              'Bairro:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const ListTile(
            title: Text(
              'E-mail:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const ListTile(
            title: Text(
              'Data de Expedição:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const ListTile(
            title: Text(
              'Raça:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const ListTile(
            title: Text(
              'Data de nascimento:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const ListTile(
            title: Text(
              'Telefone:',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CartaoVacina()),
                );
              },
              child: const Text('Cartão de Vacina'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Anamnese()),
                );
              },
              child: const Text('Anamnese'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Download'),
            ),
          ]),
        ],
      ),
    );
  }
}

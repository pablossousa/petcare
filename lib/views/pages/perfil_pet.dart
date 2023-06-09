import 'package:flutter/material.dart';
import 'package:mds/views/pages/anamneses_page.dart';
import 'package:mds/views/pages/cartao_vacina_page.dart';

import '../../data/database/database.dart';

//ignore: must_be_immutable
class PerfilPet extends StatefulWidget {
  Usuario dadosUsuario;
  Pet dadosPet;

  PerfilPet({Key? key, required this.dadosUsuario, required this.dadosPet}) : super(key: key);

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
          ListTile(
            title: const Text(
              'Nome:',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              widget.dadosPet.nome,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            title: const Text(
              'Sexo:',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              widget.dadosPet.sexo,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            title: const Text(
              'Naturalidade:',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              widget.dadosPet.naturalidade,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            title: const Text(
              'Endereço:',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              widget.dadosUsuario.endereco,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            title: const Text(
              'E-mail:',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              widget.dadosUsuario.email,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            title: const Text(
              'Data de Expedição:',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              widget.dadosPet.cadastro.toString(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            title: const Text(
              'Raça:',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              widget.dadosPet.raca,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            title: const Text(
              'Data de nascimento:',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              widget.dadosPet.nascimento.toString(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            title: const Text(
              'Telefone:',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              widget.dadosUsuario.celular ?? 'Nenhum Telefone Cadastrado',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CartaoVacinaPage(idPet: widget.dadosPet.id,)),
                );
              },
              child: const Text('Cartão de Vacina'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AnamnesesPage(petId: widget.dadosPet.id,)),
                );
              },
              child: const Text('Anamnese'),
            ),
          ]),
        ],
      ),
    );
  }
}

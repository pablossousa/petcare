import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mds/views/pages/alterar_pet_page.dart';
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
        title: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(
                    builder: (context) => AlterarPetPage(dadosPet: widget.dadosPet,)
                )
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Perfil de ${widget.dadosPet.nome}'),
              const Icon(Icons.draw)
            ],
          )
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Nome:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.dadosPet.nome,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Sexo:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.dadosPet.sexo,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Naturalidade:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.dadosPet.naturalidade,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Endereço:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.dadosUsuario.endereco,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Email:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.dadosUsuario.email,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Data de expidição:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                DateFormat('dd/MM/yyyy kk:mm').format(widget.dadosPet.cadastro).toString(),
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Raça:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.dadosPet.raca,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Data de nascimento:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                DateFormat('dd/MM/yyyy').format(widget.dadosPet.nascimento).toString(),
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Telefone:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.dadosUsuario.celular == "" ? "-" : widget.dadosUsuario.celular!,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 68, 132, 140),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 68, 132, 140),
                minimumSize: const Size.fromHeight(60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
            ),
            child: const Text(
              "Cartão de Vacinas",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CartaoVacinaPage(idPet: widget.dadosPet.id,)),
              );
            },
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 68, 132, 140),
                minimumSize: const Size.fromHeight(60),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
            ),
            child: const Text(
              "Anamneses",
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AnamnesesPage(dadosPet: widget.dadosPet,)),
              );
            },
          ),
        ],
      ),
    );
  }
}

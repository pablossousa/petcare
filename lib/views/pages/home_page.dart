import 'package:flutter/material.dart';
import 'package:mds/views/pages/alterar_page.dart';
import 'package:mds/views/pages/perfil_pet.dart';
import 'package:provider/provider.dart';
import 'cadastro_pet_page.dart';

import '../../data/database/database.dart';

//ignore: must_be_immutable
class HomePage extends StatefulWidget {
  Usuario? dadosUsuario;

  HomePage({Key? key, this.dadosUsuario}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    builder: (context) => AlterarPage(dadosUsuario: widget.dadosUsuario,)
                )
            );
          },
          child: Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.account_circle),
                Text(widget.dadosUsuario!.nome),
                const Icon(Icons.draw),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 15 , left: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Meus Pets',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _buildPetList(context),
          ],
        ),
      ),
    );
  }

  StreamBuilder<List<Pet>> _buildPetList(BuildContext context) {
    final petDao = Provider.of<PetsDao>(context);
    return StreamBuilder(
        stream: petDao.watchAllPetsUsuario(widget.dadosUsuario!.id),
        builder: (context, AsyncSnapshot<List<Pet>> snapshot) {
          final pets = snapshot.data ?? List.empty();

          return ListView.builder(
            shrinkWrap: true,
            itemCount: pets.length + 1,
            itemBuilder: (_, index) {
              final itemPet = index == 0 ? null : pets[index-1];
              return index == 0
                ? _buildAddPetItem()
                : _buildListItem(itemPet!, petDao);
            },
          );
        }
    );
  }

  Widget _buildAddPetItem() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => CadastroPetPage(idUsuario: widget.dadosUsuario!.id,)
          ),
        );
      },
      child: const Card(
        child: ListTile(
          leading: Icon(Icons.add, color: Color.fromARGB(255, 68, 132, 140),),
          title: Text("Adicionar um pet", style: TextStyle(color: Color.fromARGB(255, 68, 132, 140),fontWeight: FontWeight.w400),),
        ),
      ),
    );
  }

  Widget _buildListItem(Pet itemPet, PetsDao petDao) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => PerfilPet(dadosUsuario: widget.dadosUsuario!, dadosPet: itemPet,)
            )
        );
      },
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.pets, color: Color.fromARGB(255, 68, 132, 140),),
          title: Text(itemPet.nome, style: const TextStyle(color: Color.fromARGB(255, 68, 132, 140),fontWeight: FontWeight.w400),),
        ),
      ),
    );
  }
}

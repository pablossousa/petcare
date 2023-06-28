import 'package:flutter/material.dart';
import 'package:mds/views/components/show_dialog_message.dart';
import 'package:mds/views/pages/alterar_page.dart';
import 'package:mds/views/pages/alterar_pet_page.dart';
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
        title: ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text(widget.dadosUsuario!.nome),
          subtitle: Text(widget.dadosUsuario!.email),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(
                      builder: (context) => AlterarPage(dadosUsuario: widget.dadosUsuario,)
                    )
                  );
                },
                icon: const Icon(Icons.change_circle),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 20,
          ),
          const Text(
            'Meus Pets',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          _buildPetList(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => CadastroPetPage(idUsuario: widget.dadosUsuario!.id,)
            ),
          );
        },
      )
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
            itemCount: pets.length,
            itemBuilder: (_, index) {
              final itemPet = pets[index];
              return _buildListItem(itemPet, petDao);
            },
          );
        }
    );
  }

  Widget _buildListItem(Pet itemPet, PetsDao petDao) {
    return Card(
      child: ListTile(
        title: Text(itemPet.nome),
        subtitle: Text(itemPet.raca),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => PerfilPet(dadosUsuario: widget.dadosUsuario!, dadosPet: itemPet,)
                      )
                  );
                },
                icon: const Icon(Icons.account_circle)
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => AlterarPetPage(dadosPet: itemPet,)
                      )
                  );
                },
                icon: const Icon(Icons.change_circle)
            ),
            IconButton(
                onPressed: () async {
                  final petDao = Provider.of<PetsDao>(context, listen: false);
                  final resultado = await petDao.deletePet(itemPet);

                  if(resultado.result == false && context.mounted) {
                    showErrorMessage(context, "Falha ao deletar pet", resultado.message!);
                  }
                },
                icon: const Icon(Icons.delete)
            )
          ],
        ),
      ),
    );
  }
}

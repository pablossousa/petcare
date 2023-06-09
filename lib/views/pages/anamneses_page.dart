import 'package:flutter/material.dart';
import 'package:mds/data/database/database.dart';
import 'package:mds/views/pages/anamnese_page.dart';
import 'package:mds/views/pages/cadastro_anamnese_page.dart';
import 'package:provider/provider.dart';

//ignore: must_be_immutable
class AnamnesesPage extends StatefulWidget {
  int? petId;

  AnamnesesPage({Key? key, this.petId}) : super(key: key);

  @override
  State<AnamnesesPage> createState() => _AnamnesesPageState();
}

class _AnamnesesPageState extends State<AnamnesesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anamneses'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 20,
          ),
          const Text(
            'Minhas Anamneses',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          _buildAnamneseList(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => CadastroAnamnsePage(idPet: widget.petId!,),
            ),
          );
        },
      ),
    );
  }

  StreamBuilder<List<Anamnese>> _buildAnamneseList(BuildContext context) {
    final anamneseDao = Provider.of<AnamnesesDao>(context);
    return StreamBuilder(
        stream: anamneseDao.watchAllAnamnesesPet(widget.petId!),
        builder: (context, AsyncSnapshot<List<Anamnese>> snapshot) {
          final anamneses = snapshot.data ?? List.empty();

          return ListView.builder(
            shrinkWrap: true,
            itemCount: anamneses.length,
            itemBuilder: (_, index) {
              final itemAnamnese = anamneses[index];
              return _buildListItem(itemAnamnese, anamneseDao);
            },
          );
        }
    );
  }
  
  Widget _buildListItem(Anamnese itemAnamnese, AnamnesesDao anamneseDao) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.format_align_center_sharp),
          title: Text( 'Anamnese dia: ${itemAnamnese.cadastro.toString()}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => AnamnesePage(dadosAnamnese: itemAnamnese,)
                    )
                  );
                },
                icon: const Icon(Icons.account_circle),
              ),
              IconButton(
                onPressed: () {
                  anamneseDao.deleteAnamnese(itemAnamnese);
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


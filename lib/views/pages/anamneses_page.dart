import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mds/data/database/database.dart';
import 'package:mds/views/components/show_dialog_message.dart';
import 'package:mds/views/pages/anamnese_page.dart';
import 'package:mds/views/pages/cadastro_anamnese_page.dart';
import 'package:provider/provider.dart';

//ignore: must_be_immutable
class AnamnesesPage extends StatefulWidget {
  Pet dadosPet;

  AnamnesesPage({Key? key, required this.dadosPet}) : super(key: key);

  @override
  State<AnamnesesPage> createState() => _AnamnesesPageState();
}

class _AnamnesesPageState extends State<AnamnesesPage> {
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
        title: const Text('Anamneses'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 15 , left: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Anamneses',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _buildAnamneseList(context),
          ],
        ),
      ),
    );
  }

  StreamBuilder<List<Anamnese>> _buildAnamneseList(BuildContext context) {
    final anamneseDao = Provider.of<AnamnesesDao>(context);
    return StreamBuilder(
        stream: anamneseDao.watchAllAnamnesesPet(widget.dadosPet.id),
        builder: (context, AsyncSnapshot<List<Anamnese>> snapshot) {
          final anamneses = snapshot.data ?? List.empty();

          return ListView.builder(
            shrinkWrap: true,
            itemCount: anamneses.length + 1,
            itemBuilder: (_, index) {
              final itemAnamnese = index == 0 ? null : anamneses[index-1];
              return index == 0
                ? _buildAddAnamneseItem()
                : _buildListItem(itemAnamnese!, anamneseDao);
            },
          );
        }
    );
  }

  Widget _buildAddAnamneseItem() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => CadastroAnamnsePage(idPet: widget.dadosPet.id,),
          ),
        );
      },
      child: const Card(
        child: ListTile(
          leading: Icon(Icons.add, color: Color.fromARGB(255, 68, 132, 140),),
          title: Text("Adicionar uma anamnese", style: TextStyle(color: Color.fromARGB(255, 68, 132, 140),fontWeight: FontWeight.w400),),
        ),
      ),
    );
  }
  
  Widget _buildListItem(Anamnese itemAnamnese, AnamnesesDao anamneseDao) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context) => AnamnesePage(dadosAnamnese: itemAnamnese,)
            )
        );
      },
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.format_align_center_sharp, color: Color.fromARGB(255, 68, 132, 140),),
          title: Text(
            'Anamnese: ${DateFormat('dd/MM/yyyy kk:mm').format(itemAnamnese.cadastro).toString()}',
            style: const TextStyle(color: Color.fromARGB(255, 68, 132, 140),fontWeight: FontWeight.w400),
          ),
          trailing: IconButton(
            onPressed: () async {
              bool? retorno = await showDialog(
                  context: context,
                  builder: (context) => _DeleteDialog()
              );
              if(retorno! && context.mounted) {
                final resultado = await anamneseDao.deleteAnamnese(itemAnamnese);

                if(resultado.result == false && context.mounted) {
                  showErrorMessage(context, "Falha ao deletar anamnese", resultado.message!);
                }
              }
            },
            icon: const Icon(Icons.delete, color: Color.fromARGB(255, 68, 132, 140),),
          ),
        ),
      ),
    );
  }
}

class _DeleteDialog extends StatefulWidget {
  @override
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<_DeleteDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Deletar a anamnese"),
      content: const Text("Você realmente deseja deletar a anamnese?"),
      actions: [
        ElevatedButton(
          child: const Text("Confirmar"),
          onPressed: () => Navigator.of(context).pop(true),
        ),
        ElevatedButton(
          child: const Text("Cancelar"),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      ],
    );
  }
}
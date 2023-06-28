import 'package:flutter/material.dart';
import 'package:mds/views/components/show_dialog_message.dart';
import 'package:mds/views/pages/cadastro_vacinacao.dart';
import 'package:mds/views/pages/vacina_page.dart';
import 'package:provider/provider.dart';

import '../../data/database/database.dart';

//ignore: must_be_immutable
class CartaoVacinaPage extends StatefulWidget {
  int? idPet;

  CartaoVacinaPage({Key? key, this.idPet}) : super(key: key);

  @override
  State<CartaoVacinaPage> createState() => _CartaoVacinaPageState();
}

class _CartaoVacinaPageState extends State<CartaoVacinaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartão de Vacina'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 20,
          ),
          const Text(
            'Controle de Vacinação',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          _buildVacinacaoList(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => CadastroVacinacaoPage(idPet: widget.idPet!,)
            ),
          );
        },
      ),
    );
  }

  StreamBuilder<List<VacinacaoWithVacina>> _buildVacinacaoList(BuildContext context) {
    final vacinacaoDao = Provider.of<VacinacaosDao>(context);
    return StreamBuilder(
      stream: vacinacaoDao.watchAllVacinacaoWithVacina(widget.idPet!),
      builder: (context, AsyncSnapshot<List<VacinacaoWithVacina>> snapshot) {
        final vacinacaos = snapshot.data ?? List.empty();

        return ListView.builder(
          shrinkWrap: true,
          itemCount: vacinacaos.length,
          itemBuilder: (_, index) {
            final itemVacinacaoWithVacina = vacinacaos[index];
            return _buildListItem(itemVacinacaoWithVacina, vacinacaoDao);
          },
        );
      },
    );
  }

  Widget _buildListItem(VacinacaoWithVacina itemVacinacaoWithVacina, VacinacaosDao vacinacaosDao) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => VacinaPage(dadosVacina: itemVacinacaoWithVacina,)
          )
        );
      },
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Vacina:',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              itemVacinacaoWithVacina.vacina.nome,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            title: const Text(
              'Dose:',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              itemVacinacaoWithVacina.vacinacao.dose.toString(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            title: const Text(
              'Data:',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              itemVacinacaoWithVacina.vacinacao.dataHora.toString(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            title: const Text(
              'Revacina:',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(
              itemVacinacaoWithVacina.vacinacao.retorno.toString(),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final vacinacaoDao = Provider.of<VacinacaosDao>(context, listen: false);
              final resultado = await vacinacaoDao.deleteVacinacao(itemVacinacaoWithVacina.vacinacao);

              if(resultado.result == false && context.mounted) {
                showErrorMessage(context, "Falha ao deletar vacinação", resultado.message!);
              }
            },
          )
        ],
      ),
    );
  }
}


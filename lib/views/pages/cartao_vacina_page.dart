import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
        title: const Text('Cartão de Vacina'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 15 , left: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Controle de vacinação',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 68, 132, 140),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _buildVacinacaoList(context),
          ],
        ),
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
          itemCount: vacinacaos.length + 1,
          itemBuilder: (_, index) {
            final itemVacinacaoWithVacina = index == 0 ? null : vacinacaos[index-1];
            return index == 0
                ? _buildAddVacinacaoItem()
                : _buildListItem(itemVacinacaoWithVacina!, vacinacaoDao);
          },
        );
      },
    );
  }

  Widget _buildAddVacinacaoItem() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => CadastroVacinacaoPage(idPet: widget.idPet!,)
          ),
        );
      },
      child: const Card(
        child: ListTile(
          leading: Icon(Icons.add, color: Color.fromARGB(255, 68, 132, 140),),
          title: Text("Adicionar uma vacinação", style: TextStyle(color: Color.fromARGB(255, 68, 132, 140),fontWeight: FontWeight.w400),),
        ),
      ),
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
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Vacina: ",
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
                        itemVacinacaoWithVacina.vacina.nome,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 68, 132, 140),
                        ),
                      )
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Color.fromARGB(255, 68, 132, 140),),
                    onPressed: () async {
                      bool? retorno = await showDialog(
                          context: context,
                          builder: (context) => _DeleteDialog()
                      );
                      if(retorno! && context.mounted) {
                        final vacinacaoDao = Provider.of<VacinacaosDao>(context, listen: false);
                        final resultado = await vacinacaoDao.deleteVacinacao(itemVacinacaoWithVacina.vacinacao);

                        if(resultado.result == false && context.mounted) {
                          showErrorMessage(context, "Falha ao deletar vacinação", resultado.message!);
                        }
                      }
                    },
                  )
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Dose: ",
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
                        itemVacinacaoWithVacina.vacinacao.dose.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 68, 132, 140),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Lote: ",
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
                        itemVacinacaoWithVacina.vacinacao.lote.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 68, 132, 140),
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  const Text(
                    "Data de aplicação: ",
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
                    DateFormat('dd/MM/yyyy').format(itemVacinacaoWithVacina.vacinacao.dataHora).toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 68, 132, 140),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  const Text(
                    "Data de retorno: ",
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
                    DateFormat('dd/MM/yyyy').format(itemVacinacaoWithVacina.vacinacao.retorno).toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 68, 132, 140),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15,),
              Row(
                children: [
                  const Text(
                    "Veterinário(a): ",
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
                    itemVacinacaoWithVacina.vacinacao.vaterinario,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 68, 132, 140),
                    ),
                  )
                ],
              )
            ],
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
      title: const Text("Deletar a vacinção"),
      content: const Text("Você realmente deseja deletar a vacinação?"),
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
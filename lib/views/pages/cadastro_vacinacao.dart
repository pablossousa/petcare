import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:drift/drift.dart' as d;
import 'package:provider/provider.dart';

import '../../data/database/database.dart';

//ignore: must_be_immutable
class CadastroVacinacaoPage extends StatefulWidget {
  int? idPet;

  CadastroVacinacaoPage({Key? key, this.idPet}) : super(key: key);

  @override
  State<CadastroVacinacaoPage> createState() => _CadastroVacinacaoPageState();
}

class _CadastroVacinacaoPageState extends State<CadastroVacinacaoPage> {
  late TextEditingController _veterinarioController;
  late Vacina? _vacina;
  late DateTime _data = DateUtils.dateOnly(DateTime.now());
  late DateTime _retorno = DateUtils.dateOnly(DateTime.now());
  late TextEditingController _doseController;
  late TextEditingController _loteController;

  String? _veterinarioErrorMessage;
  String? _doseErrorMessage;
  String? _loteErrorMessage;

  @override
  void initState() {
    super.initState();
    _veterinarioController = TextEditingController();
    _doseController = TextEditingController();
    _loteController = TextEditingController();
    _vacina = null;
  }

  @override
  void dispose() {
    _veterinarioController.dispose();
    _doseController.dispose();
    _loteController.dispose();
    super.dispose();
  }

  void _showErrorMessage(BuildContext context) {
    Widget okButton = TextButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('Ok'),
    );

    AlertDialog alerta = AlertDialog(
      title: const Text('Falha ao fazer o cadastro da vacinação'),
      content: const Text('Ocorreu um erro ao fazer o cadastro da vacinação, tente novamente'),
      actions: [
        okButton,
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alerta;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de Vacinação'),
        ),
        body: ListView(
          children: [
            const ListTile(
              title: Text(
                'Veterinário(a)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildVeterinarioField(context),
            const ListTile(
              title: Text(
                'Vacina',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildVacinaSelector(context),
            const ListTile(
              title: Text(
                'Data',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buidDataDateTimeField(context),
            const ListTile(
              title: Text(
                'Retorno',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buidRetornoDateTimeField(context),
            const ListTile(
              title: Text(
                'Dose',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildDoseField(context),
            const ListTile(
              title: Text(
                'Lote',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildLoteField(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final veterinario = _veterinarioController.value.text;
                    final dose = _doseController.value.text;
                    final lote = _loteController.value.text;

                    _veterinarioErrorMessage = veterinario.isEmpty ? 'Digite um veterinário(a)' : null;
                    _doseErrorMessage = dose.isEmpty ? 'Digite uma dose' : null;
                    _loteErrorMessage = lote.isEmpty ? 'Digite um lote' : null;

                    if(_veterinarioErrorMessage == null && _vacina != null
                      && _doseErrorMessage == null && _loteErrorMessage == null) {
                      final vacinacaoDao = Provider.of<VacinacaosDao>(context, listen: false);
                      final result = await vacinacaoDao.insertVacinacao(VacinacaosCompanion(
                        petId: d.Value(widget.idPet!),
                        vacinaId: d.Value(_vacina!.id),
                        vaterinario: d.Value(veterinario),
                        dataHora: d.Value(_data),
                        retorno: d.Value(_retorno),
                        dose: d.Value(int.parse(dose)),
                        lote: d.Value(int.parse(lote)),
                      ));

                      if(result == 0 && context.mounted) {
                        _showErrorMessage(context);
                      } else {
                        Navigator.pop(context);
                      }
                    }

                    setState(() {});
                  },
                  child: const Text('Cadastrar Vacinação'),
                ),
              ],
            )
          ],
        )
    );
  }

  Padding _buildVeterinarioField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: _veterinarioController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
          ),
          errorText: _veterinarioErrorMessage
        ),
      ),
    );
  }

  StreamBuilder<List<Vacina>> _buildVacinaSelector(BuildContext context) {
    return StreamBuilder<List<Vacina>>(
      stream: Provider.of<VacinasDao>(context).watchAllVacinas(),
      builder: (context, snapshot) {
        final vacinas = snapshot.data ?? List.empty();

        DropdownMenuItem<Vacina> dropdownFromVacina(Vacina vacina) {
          return DropdownMenuItem(
            value: vacina,
            child: Text(vacina.nome),
          );
        }

        final dropdownMenuItems =
            vacinas.map((vacina) => dropdownFromVacina(vacina)).toList()
              ..insert(
                0,
                const DropdownMenuItem(
                  value: null,
                  child: Text('-- Selecione uma vacina --'),
                ),
              );

        return Container(
          padding: const EdgeInsets.all(10),
          child: DropdownButton(
            onChanged: (Vacina? vacina) {
              setState(() {
                _vacina = vacina;
              });
            },
            isExpanded: true,
            value: _vacina,
            items: dropdownMenuItems,
          ),
        );
      },
    );
  }

  Padding _buidDataDateTimeField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DateTimeField(
        onDateSelected: (value) {
          setState(() {
            _data = value;
          });
        },
        dateFormat: DateFormat.yMMMMd(),
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
          ),
        ),
        firstDate: DateTime(2000, 1, 1),
        selectedDate: _data,
      ),
    );
  }

  Padding _buidRetornoDateTimeField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DateTimeField(
        onDateSelected: (value) {
          setState(() {
            _retorno = value;
          });
        },
        dateFormat: DateFormat.yMMMMd(),
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
          ),
        ),
        firstDate: DateTime(2000, 1, 1),
        selectedDate: _retorno,
      ),
    );
  }

  Padding _buildDoseField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: _doseController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
          ),
          errorText: _doseErrorMessage
        ),
      ),
    );
  }

  Padding _buildLoteField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: _loteController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)
          ),
          errorText: _loteErrorMessage
        ),
      ),
    );
  }
}

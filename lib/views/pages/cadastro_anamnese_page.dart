import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;

import '../../data/database/database.dart';

//ignore: must_be_immutable
class CadastroAnamnsePage extends StatefulWidget {
  int? idPet;

  CadastroAnamnsePage({Key? key, this.idPet}) : super(key: key);

  @override
  State<CadastroAnamnsePage> createState() => _CadastroAnamnsePageState();
}

class _CadastroAnamnsePageState extends State<CadastroAnamnsePage> {
  late TextEditingController _queixaController;
  late TextEditingController _alimentacaoController;
  late TextEditingController _doencasController;
  late TextEditingController _alergiasController;
  late TextEditingController _tempoController;
  late TextEditingController _tipoController;
  late TextEditingController _ambienteController;
  bool _fugiu = false;
  bool _pulga = false;
  bool _carrapato = false;
  late TextEditingController _vacinaController;
  late TextEditingController _vermifugacaoController;

  String? _queiErro;
  String? _alimErro;
  String? _doenErro;
  String? _alerErro;
  String? _tempErro;
  String? _tipoErro;
  String? _ambiErro;
  String? _vaciErro;
  String? _vermErro;

  @override
  void initState() {
    super.initState();
    _queixaController = TextEditingController();
    _alimentacaoController = TextEditingController();
    _doencasController = TextEditingController();
    _alergiasController = TextEditingController();
    _tempoController = TextEditingController();
    _tipoController = TextEditingController();
    _ambienteController = TextEditingController();
    _vacinaController = TextEditingController();
    _vermifugacaoController = TextEditingController();
  }

  @override
  void dispose() {
    _queixaController.dispose();
    _alimentacaoController.dispose();
    _doencasController.dispose();
    _alergiasController.dispose();
    _tempoController.dispose();
    _tipoController.dispose();
    _ambienteController.dispose();
    _vacinaController.dispose();
    _vermifugacaoController.dispose();
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
      title: const Text('Falha ao fazer o cadastro da anamnese'),
      content: const Text('Ocorreu um erro ao fazer o cadastro da anamnese, tente novamente'),
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
          title: const Text('Cadastrar Anamnese'),
        ),
        body: ListView(
          children: [
            const ListTile(
              title: Text(
                'Queixa Principal',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildQueixaField(context),
            const ListTile(
              title: Text(
                'Alimentação',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildAlimentacaoField(context),
            const ListTile(
              title: Text(
                'Doenças Anteriores',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildDoencasField(context),
            const ListTile(
              title: Text(
                'Alergias',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildAlergiasField(context),
            const ListTile(
              title: Text(
                'Tempo Evolução',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildTempoField(context),
            const ListTile(
              title: Text(
                'Tipo Evolução',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildTipoField(context),
            const ListTile(
              title: Text(
                'Ambiente ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildAmbienteField(context),
            _buildCheckboxesTile(context),
            const ListTile(
              title: Text(
                'Vacina',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildVacinaField(context),
            const ListTile(
              title: Text(
                'Vermifugação',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            _buildVermifugacaoField(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final queixa = _queixaController.value.text;
                    final alimentacao = _alimentacaoController.value.text;
                    final doencas = _doencasController.value.text;
                    final alergias = _alergiasController.value.text;
                    final tempo = _tempoController.value.text;
                    final tipo = _tipoController.value.text;
                    final ambiente = _ambienteController.value.text;
                    final vacina = _vacinaController.value.text;
                    final vermifugacao = _vermifugacaoController.value.text;

                    _queiErro = queixa.isEmpty ? 'Digite alguma coisa' : null;
                    _alimErro = alimentacao.isEmpty ? 'Digite alguma coisa' : null;
                    _doenErro = doencas.isEmpty ? 'Digite alguma coisa' : null;
                    _alerErro = alergias.isEmpty ? 'Digite alguma coisa' : null;
                    _tempErro = tempo.isEmpty ? 'Digite alguma coisa' : null;
                    _tipoErro = tipo.isEmpty ? 'Digite alguma coisa' : null;
                    _ambiErro = ambiente.isEmpty ? 'Digite alguma coisa' : null;
                    _vaciErro = vacina.isEmpty ? 'Digite alguma coisa' : null;
                    _vermErro = vermifugacao.isEmpty ? 'Digite alguma coisa' : null;

                    if(_queiErro == null && _alimErro == null && _doenErro == null
                      && _alerErro == null && _tempErro == null && _tipoErro == null
                      && _ambiErro == null && _vaciErro == null && _vermErro == null) {
                      final anamneseDao = Provider.of<AnamnesesDao>(context, listen: false);
                      final result = anamneseDao.insertAnamnese(AnamnesesCompanion(
                        petId: d.Value(widget.idPet!),
                        queixaPrincipal: d.Value(queixa),
                        alimentacao: d.Value(alimentacao),
                        doencasAnteriores: d.Value(doencas),
                        alergias: d.Value(alergias),
                        tempoEvolucao: d.Value(tempo),
                        tipoEvolucao: d.Value(tipo),
                        ambiente: d.Value(ambiente),
                        fugiuRecentemente: d.Value(_fugiu),
                        pulgas: d.Value(_pulga),
                        carrapatos: d.Value(_carrapato),
                        vacina: d.Value(vacina),
                        vermifugaco: d.Value(vermifugacao),
                        cadastro: d.Value(DateTime.now())
                      ));

                      if(result == 0 && context.mounted) {

                      } else {
                        Navigator.pop(context);
                      }
                    }

                    setState(() {});
                  },
                  child: const Text('Cadastrar'),
                )
              ],
            )
          ],
        )
    );
  }

  Padding _buildQueixaField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _queixaController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
            ),
            errorText: _queiErro
        ),
      ),
    );
  }

  Padding _buildAlimentacaoField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _alimentacaoController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
            ),
            errorText: _alimErro
        ),
      ),
    );
  }

  Padding _buildDoencasField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _doencasController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
            ),
            errorText: _doenErro
        ),
      ),
    );
  }

  Padding _buildAlergiasField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _alergiasController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
            ),
            errorText: _alerErro
        ),
      ),
    );
  }

  Padding _buildTempoField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _tempoController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
            ),
            errorText: _tempErro
        ),
      ),
    );
  }

  Padding _buildTipoField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _tipoController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
            ),
            errorText: _tipoErro
        ),
      ),
    );
  }

  Padding _buildAmbienteField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _ambienteController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
            ),
            errorText: _ambiErro
        ),
      ),
    );
  }

  Padding _buildCheckboxesTile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CheckboxListTile(
              title: const Text(
                'Fugiu Recentemente',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              value: _fugiu,
              activeColor: Colors.cyan,
              onChanged: (newBool) {
                setState(() {
                  _fugiu = newBool!;
                });
              }
          ),
          CheckboxListTile(
              title: const Text(
                'Pulgas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              value: _pulga,
              activeColor: Colors.cyan,
              onChanged: (newBool) {
                setState(() {
                  _pulga = newBool!;
                });
              }
          ),
          CheckboxListTile(
              title: const Text(
                'Carrapatos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              value: _carrapato,
              activeColor: Colors.cyan,
              onChanged: (newBool) {
                setState(() {
                  _carrapato = newBool!;
                });
              }
          ),
        ],
      ),
    );
  }

  Padding _buildVacinaField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _vacinaController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
            ),
            errorText: _vaciErro
        ),
      ),
    );
  }

  Padding _buildVermifugacaoField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: _vermifugacaoController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
            ),
            errorText: _vermErro
        ),
      ),
    );
  }
}

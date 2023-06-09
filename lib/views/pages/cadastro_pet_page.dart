import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;

import '../../data/database/database.dart';

//ignore: must_be_immutable
class CadastroPetPage extends StatefulWidget {
  int? idUsuario;

  CadastroPetPage({Key? key, this.idUsuario}) : super(key: key);

  @override
  State<CadastroPetPage> createState() => _CadastroPetPageState();
}

class _CadastroPetPageState extends State<CadastroPetPage> {
  late TextEditingController _nomeController;
  late TextEditingController _pesoController;
  late TextEditingController _idadeController;
  late TextEditingController _racaController;
  DateTime _dataNascimento = DateUtils.dateOnly(DateTime.now());
  late TextEditingController _especieController;
  late TextEditingController _sexoController;
  late TextEditingController _naturalidadeController;

  String? _nomeErrorMessage;
  String? _pesoErrorMessage;
  String? _idadeErrorMessage;
  String? _racaErrorMessage;
  String? _especieErrorMessage;
  String? _sexoErrorMessage;
  String? _naturalidadeErrorMessage;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController();
    _pesoController = TextEditingController();
    _idadeController = TextEditingController();
    _racaController = TextEditingController();
    _especieController = TextEditingController();
    _sexoController = TextEditingController();
    _naturalidadeController = TextEditingController();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _pesoController.dispose();
    _idadeController.dispose();
    _racaController.dispose();
    _especieController.dispose();
    _sexoController.dispose();
    _naturalidadeController.dispose();
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
      title: const Text('Falha ao fazer o cadastro de pet'),
      content: const Text('Ocorreu um erro ao fazer o cadastro de pet, tente novamente'),
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
        title: const Text('Cadastro do Pet'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNomeTextField(context),
              const SizedBox(height: 15),
              _buildIdadeTextField(context),
              const SizedBox(height: 15),
              _buildEspecieTextField(context),
              const SizedBox(height: 15),
              _buidNascimentoDateTimeField(context),
              const SizedBox(height: 15),
              _buildRacaTextField(context),
              const SizedBox(height: 15),
              _buildPesoTextField(context),
              const SizedBox(height: 15),
              _buildSexoTextField(context),
              const SizedBox(height: 15),
              _buildNaturalidadeTextField(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final nome = _nomeController.value.text;
                      final peso = _pesoController.value.text;
                      final idade = _idadeController.value.text;
                      final raca = _racaController.value.text;
                      final especie = _especieController.value.text;
                      final sexo = _sexoController.value.text;
                      final naturalidade = _naturalidadeController.value.text;

                      _nomeErrorMessage = nome.isEmpty ? 'Digite um nome' : null;
                      _pesoErrorMessage = peso.isEmpty ? 'Digite um peso' : null;
                      _idadeErrorMessage = idade.isEmpty ? 'Digite uma idade' : null;
                      _racaErrorMessage = raca.isEmpty ? 'Digite uma raça' : null;
                      _especieErrorMessage = especie.isEmpty ? 'Digite uma espécie' : null;
                      _sexoErrorMessage = sexo.isEmpty ? 'Digite um sexo' : null;
                      _naturalidadeErrorMessage = naturalidade.isEmpty ? 'Digite uma naturalidade' : null;

                      if(_nomeErrorMessage == null && _pesoErrorMessage == null
                        && _idadeErrorMessage == null && _racaErrorMessage == null
                        && _especieErrorMessage == null && _sexoErrorMessage == null
                        && _naturalidadeErrorMessage == null) {
                        final petDao = Provider.of<PetsDao>(context, listen: false);
                        final result = await petDao.insertPet(PetsCompanion(
                          usuarioId: d.Value(widget.idUsuario!),
                          nome: d.Value(nome),
                          peso: d.Value(double.parse(peso)),
                          idade: d.Value(double.parse(idade)),
                          raca: d.Value(raca),
                          nascimento: d.Value(_dataNascimento),
                          especie: d.Value(especie),
                          sexo: d.Value(sexo),
                          naturalidade: d.Value(naturalidade),
                          cadastro: d.Value(DateTime.now()),
                        ));

                        if(result == 0 && context.mounted) {
                          _showErrorMessage(context);
                        } else {
                          Navigator.pop(context);
                        }
                      }
                      setState(() {});
                    },
                    child: const Text('Cadastrar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField _buildNomeTextField(BuildContext context) {
    return TextField(
      controller: _nomeController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Nome',
        border: const OutlineInputBorder(),
        errorText: _nomeErrorMessage,
      ),
    );
  }

  TextField _buildPesoTextField(BuildContext context) {
    return TextField(
      controller: _pesoController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Peso',
        border: const OutlineInputBorder(),
        errorText: _pesoErrorMessage,
      ),
    );
  }

  TextField _buildIdadeTextField(BuildContext context) {
    return TextField(
      controller: _idadeController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Idade',
        border: const OutlineInputBorder(),
        errorText: _idadeErrorMessage,
      ),
    );
  }

  TextField _buildRacaTextField(BuildContext context) {
    return TextField(
      controller: _racaController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Raça',
        border: const OutlineInputBorder(),
        errorText: _racaErrorMessage,
      ),
    );
  }

  DateTimeField _buidNascimentoDateTimeField(BuildContext context) {
    return DateTimeField(
      onDateSelected: (value) {
        setState(() {
          _dataNascimento = value;
        });
      },
      dateFormat: DateFormat.yMMMMd(),
      decoration: const InputDecoration(
        labelText: 'Data de Nascimento',
        border: OutlineInputBorder(),
      ),
      firstDate: DateTime(2000, 1, 1),
      selectedDate: _dataNascimento,
    );
  }

  TextField _buildEspecieTextField(BuildContext context) {
    return TextField(
      controller: _especieController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Espécie',
        border: const OutlineInputBorder(),
        errorText: _especieErrorMessage
      ),
    );
  }
  
  TextField _buildSexoTextField(BuildContext context) {
    return TextField(
      controller: _sexoController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Sexo',
        border: const OutlineInputBorder(),
        errorText: _sexoErrorMessage,
      ),
    );
  }
  
  TextField _buildNaturalidadeTextField(BuildContext context) {
    return TextField(
      controller: _naturalidadeController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Naturalidade',
        border: const OutlineInputBorder(),
        errorText: _naturalidadeErrorMessage,
      ),
    );
  }
}

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mds/views/components/buildTextField.dart';
import 'package:mds/views/components/show_dialog_message.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro do Pet'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTextField(context, _nomeController, TextInputType.text, 'Nome', _nomeErrorMessage),
                  const SizedBox(height: 15),
                  buildTextField(context, _idadeController, TextInputType.number, 'Idade', _idadeErrorMessage),
                  const SizedBox(height: 15),
                  buildTextField(context, _especieController, TextInputType.text, 'Espécie', _especieErrorMessage),
                  const SizedBox(height: 15),
                  _buidNascimentoDateTimeField(context),
                  const SizedBox(height: 15),
                  buildTextField(context, _racaController, TextInputType.text, 'Raça', _racaErrorMessage),
                  const SizedBox(height: 15),
                  buildTextField(context, _pesoController, TextInputType.number, 'Peso', _pesoErrorMessage),
                  const SizedBox(height: 15),
                  buildTextField(context, _sexoController, TextInputType.text, 'Sexo', _sexoErrorMessage),
                  const SizedBox(height: 15),
                  buildTextField(context, _naturalidadeController, TextInputType.text, 'Naturalidade', _naturalidadeErrorMessage),
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
                            final resposta = await petDao.insertPet(PetsCompanion(
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

                            if(resposta.result == false && context.mounted) {
                              showErrorMessage(context, "Falha ao cadastar pet", resposta.message!);
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
        ),
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
      mode: DateTimeFieldPickerMode.date,
      decoration: const InputDecoration(
        labelText: 'Data de Nascimento',
        border: OutlineInputBorder(),
      ),
      firstDate: DateTime(2000, 1, 1),
      selectedDate: _dataNascimento,
    );
  }
}

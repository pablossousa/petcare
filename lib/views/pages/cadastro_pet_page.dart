import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro do Pet'),
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
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            padding: const EdgeInsets.only(top: 30, left: 40, right: 40, bottom: 20),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: constraints.maxHeight
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Digite o nome do pet",
                            style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _nomeController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.black87,
                                    width: 1.0
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.black54,
                                    width: 1.0
                                )
                            ),
                            errorText: _nomeErrorMessage,
                            errorStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.0
                                )
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.0
                                )
                            ),
                          ),
                          onChanged: (value) {
                            if(_nomeErrorMessage != null) {
                              _nomeErrorMessage = null;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                    //buildTextField(context, _nomeController, TextInputType.text, 'Nome', _nomeErrorMessage),
                    const SizedBox(height: 15),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Digite a idade",
                            style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _idadeController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.black87,
                                    width: 1.0
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.black54,
                                    width: 1.0
                                )
                            ),
                            errorText: _idadeErrorMessage,
                            errorStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.0
                                )
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.0
                                )
                            ),
                          ),
                          onChanged: (value) {
                            if(_idadeErrorMessage != null) {
                              _idadeErrorMessage = null;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                    //buildTextField(context, _idadeController, TextInputType.number, 'Idade', _idadeErrorMessage),
                    const SizedBox(height: 15),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Digite o peso",
                            style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _pesoController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.black87,
                                    width: 1.0
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.black54,
                                    width: 1.0
                                )
                            ),
                            errorText: _pesoErrorMessage,
                            errorStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.0
                                )
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.0
                                )
                            ),
                          ),
                          onChanged: (value) {
                            if(_pesoErrorMessage != null) {
                              _pesoErrorMessage = null;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                    //buildTextField(context, _pesoController, TextInputType.number, 'Peso', _pesoErrorMessage),
                    const SizedBox(height: 15),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Digite a espécie",
                            style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _especieController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.black87,
                                    width: 1.0
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.black54,
                                    width: 1.0
                                )
                            ),
                            errorText: _especieErrorMessage,
                            errorStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.0
                                )
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.0
                                )
                            ),
                          ),
                          onChanged: (value) {
                            if(_especieErrorMessage != null) {
                              _especieErrorMessage = null;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                    //buildTextField(context, _especieController, TextInputType.text, 'Espécie', _especieErrorMessage),
                    const SizedBox(height: 15),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Digite a raça",
                            style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _racaController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.black87,
                                    width: 1.0
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.black54,
                                    width: 1.0
                                )
                            ),
                            errorText: _racaErrorMessage,
                            errorStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.0
                                )
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.0
                                )
                            ),
                          ),
                          onChanged: (value) {
                            if(_racaErrorMessage != null) {
                              _racaErrorMessage = null;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                    //buildTextField(context, _racaController, TextInputType.text, 'Raça', _racaErrorMessage),
                    const SizedBox(height: 15),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Digite a data de nascimento",
                            style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        _buidNascimentoDateTimeField(context),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Digite o sexo",
                            style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _sexoController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.black87,
                                    width: 1.0
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.black54,
                                    width: 1.0
                                )
                            ),
                            errorText: _sexoErrorMessage,
                            errorStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.0
                                )
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.0
                                )
                            ),
                          ),
                          onChanged: (value) {
                            if(_sexoErrorMessage != null) {
                              _sexoErrorMessage = null;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                    //buildTextField(context, _sexoController, TextInputType.text, 'Sexo', _sexoErrorMessage),
                    const SizedBox(height: 15),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Digite a naturalidade",
                            style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _naturalidadeController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.black87,
                                    width: 1.0
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.black54,
                                    width: 1.0
                                )
                            ),
                            errorText: _naturalidadeErrorMessage,
                            errorStyle: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.0
                                )
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 1.0
                                )
                            ),
                          ),
                          onChanged: (value) {
                            if(_naturalidadeErrorMessage != null) {
                              _naturalidadeErrorMessage = null;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
                    //buildTextField(context, _naturalidadeController, TextInputType.text, 'Naturalidade', _naturalidadeErrorMessage),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 68, 132, 140),
                          minimumSize: const Size.fromHeight(60),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
                      ),
                      child: const Text(
                        "CADASTRAR PET",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
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
                    ),
                  ],
                ),
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
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
                color: Colors.black87,
                width: 1.0
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
                color: Colors.black54,
                width: 1.0
            )
        ),
      ),
      firstDate: DateTime(2000, 1, 1),
      selectedDate: _dataNascimento,
    );
  }
}

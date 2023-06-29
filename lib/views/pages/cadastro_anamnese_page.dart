import 'package:flutter/material.dart';
import 'package:mds/views/components/show_dialog_message.dart';
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Cadastrar Anamnese'),
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
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Qual a queixa principal",
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
                            controller: _queixaController,
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
                              errorText: _queiErro,
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
                              if(_queiErro != null) {
                                _queiErro = null;
                                setState(() {});
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Alimentação",
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
                            controller: _alimentacaoController,
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
                              errorText: _alimErro,
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
                              if(_alimErro != null) {
                                _alimErro = null;
                                setState(() {});
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Doenças anteriores",
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
                            controller: _doencasController,
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
                              errorText: _doenErro,
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
                              if(_doenErro != null) {
                                _doenErro = null;
                                setState(() {});
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Alergias",
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
                            controller: _alergiasController,
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
                              errorText: _alerErro,
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
                              if(_alerErro != null) {
                                _alerErro = null;
                                setState(() {});
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Tempo de evolução",
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
                            controller: _tempoController,
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
                              errorText: _tempErro,
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
                              if(_tempErro != null) {
                                _tempErro = null;
                                setState(() {});
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Tipo de evolução",
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
                            controller: _tipoController,
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
                              errorText: _tipoErro,
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
                              if(_tipoErro != null) {
                                _tipoErro = null;
                                setState(() {});
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Ambiente",
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
                            controller: _ambienteController,
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
                              errorText: _ambiErro,
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
                              if(_ambiErro != null) {
                                _ambiErro = null;
                                setState(() {});
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      _buildCheckboxesTile(context),
                      const SizedBox(height: 15,),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Vacinas",
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
                            controller: _vacinaController,
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
                              errorText: _vaciErro,
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
                              if(_vaciErro != null) {
                                _vaciErro = null;
                                setState(() {});
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Vermifugação",
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
                            controller: _vermifugacaoController,
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
                              errorText: _vermErro,
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
                              if(_vermErro != null) {
                                _vermErro = null;
                                setState(() {});
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 68, 132, 140),
                            minimumSize: const Size.fromHeight(60),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
                        ),
                        child: const Text(
                          "CADASTRAR ANAMNESE",
                          style: TextStyle(
                              fontSize: 20
                          ),
                        ),
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
                            final resultado = await anamneseDao.insertAnamnese(AnamnesesCompanion(
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

                            if(resultado.result == false && context.mounted) {
                              showErrorMessage(context, "Falha ao cadastar anamnese", resultado.message!);
                            } else {
                              Navigator.pop(context);
                            }
                          }
                          setState(() {});
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
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
}

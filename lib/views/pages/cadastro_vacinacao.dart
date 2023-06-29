import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:drift/drift.dart' as d;
import 'package:mds/views/components/show_dialog_message.dart';
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro de vacinação'),
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
                            "Veterinário(a)",
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
                          controller: _veterinarioController,
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
                            errorText: _veterinarioErrorMessage,
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
                            if(_veterinarioErrorMessage != null) {
                              _veterinarioErrorMessage = null;
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
                            "Vacina",
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
                        _buildVacinaSelector(context),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Data de aplicação",
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
                        _buidDataDateTimeField(context),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Data de retorno",
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
                        _buidRetornoDateTimeField(context),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Dose da vacina",
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
                          controller: _doseController,
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
                            errorText: _doseErrorMessage,
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
                            if(_doseErrorMessage != null) {
                              _doseErrorMessage = null;
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
                            "Lote da vacina",
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
                          controller: _loteController,
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
                            errorText: _loteErrorMessage,
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
                            if(_loteErrorMessage != null) {
                              _loteErrorMessage = null;
                              setState(() {});
                            }
                          },
                        ),
                      ],
                    ),
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
                        "CADASTRAR VACINAÇÃO",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
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
                          final resposta = await vacinacaoDao.insertVacinacao(VacinacaosCompanion(
                            petId: d.Value(widget.idPet!),
                            vacinaId: d.Value(_vacina!.id),
                            vaterinario: d.Value(veterinario),
                            dataHora: d.Value(_data),
                            retorno: d.Value(_retorno),
                            dose: d.Value(int.parse(dose)),
                            lote: d.Value(int.parse(lote)),
                          ));

                          if(resposta.result == false && context.mounted) {
                            showErrorMessage(context, "Falha ao cadastrar vacinação", resposta.message!);
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

  DateTimeField _buidDataDateTimeField(BuildContext context) {
    return DateTimeField(
      onDateSelected: (value) {
        setState(() {
          _data = value;
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
      selectedDate: _data,
    );
  }

  DateTimeField _buidRetornoDateTimeField(BuildContext context) {
    return DateTimeField(
      onDateSelected: (value) {
        setState(() {
          _retorno = value;
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
      selectedDate: _retorno,
    );
  }
}

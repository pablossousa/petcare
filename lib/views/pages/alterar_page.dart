import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mds/views/components/show_dialog_message.dart';
import 'package:mds/views/pages/home_page.dart';
import 'package:mds/views/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;

import '../../data/database/database.dart';

//ignore: must_be_immutable
class AlterarPage extends StatefulWidget {
  Usuario? dadosUsuario;

  AlterarPage({Key? key, this.dadosUsuario}) : super(key: key);

  @override
  State<AlterarPage> createState() => _AlterarPageState();
}

class _AlterarPageState extends State<AlterarPage> {
  final _maskFormatter = MaskTextInputFormatter(mask: '(##) #####-####');

  late TextEditingController _nomeController;
  late TextEditingController _celularController;
  late TextEditingController _enderecoController;
  late TextEditingController _emailController;

  String? _nomeErrorMessage;
  String? _enderecoErrorMessage;
  String? _emailErrorMessage;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController()..text = widget.dadosUsuario!.nome;
    _celularController = TextEditingController()..text = widget.dadosUsuario!.celular == null ? "" : widget.dadosUsuario!.celular!;
    _enderecoController = TextEditingController()..text = widget.dadosUsuario!.endereco;
    _emailController = TextEditingController()..text = widget.dadosUsuario!.email;
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _celularController.dispose();
    _enderecoController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Alterar dados'),
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
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Digite um nome",
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
                    const SizedBox(height: 15),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Digite um telefone",
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
                          controller: _celularController,
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
                          ),
                          inputFormatters: [
                            _maskFormatter
                          ],
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
                            "Digite um enderço",
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
                          controller: _enderecoController,
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
                            errorText: _enderecoErrorMessage,
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
                            if(_enderecoErrorMessage != null) {
                              _enderecoErrorMessage = null;
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
                            "Digite um email",
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
                          controller: _emailController,
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
                            errorText: _emailErrorMessage,
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
                            if(_emailErrorMessage != null) {
                              _emailErrorMessage = null;
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
                        "ALTERAR DADOS",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      onPressed: () async {
                        final nome = _nomeController.value.text;
                        final endereco = _enderecoController.value.text;
                        final email = _emailController.value.text;

                        _nomeErrorMessage = nome.isEmpty ? 'Digite um nome' : null;
                        _enderecoErrorMessage = endereco.isEmpty ? 'Digite um endereço' : null;
                        _emailErrorMessage = email.isEmpty ? 'Digite um email' : null;

                        if(_nomeErrorMessage == null && _enderecoErrorMessage == null
                            && _emailErrorMessage == null) {
                          final usuarioDao = Provider.of<UsuariosDao>(context, listen: false);
                          final resultado = await usuarioDao.updateUsuario(UsuariosCompanion(
                            id: d.Value(widget.dadosUsuario!.id),
                            nome: d.Value(_nomeController.value.text),
                            celular: d.Value(_celularController.value.text.isEmpty ? widget.dadosUsuario?.celular : _maskFormatter.getMaskedText()),
                            endereco: d.Value(_enderecoController.value.text),
                            email: d.Value(_emailController.value.text),
                            senha: d.Value(widget.dadosUsuario!.senha),
                          ));

                          if(resultado.result == false && context.mounted) {
                            showErrorMessage(context, "Falha ao alterar conta", resultado.message!);
                          } else {
                            final usuario = await usuarioDao.findUsuario(_emailController.value.text, widget.dadosUsuario!.senha);
                            if (usuario.result == null && context.mounted) {
                              showErrorMessage(context, "Falha ao alterar conta", "Ocorreu uma falha ao alterar sua conta, tente novamente");
                            }
                            else {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage(dadosUsuario: usuario.result,)
                                  )
                              );
                            }
                          }
                        }
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: const Size.fromHeight(60),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
                      ),
                      child: const Text(
                        "DELETAR CONTA",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                      onPressed: () async {
                        bool? retorno = await showDialog(
                          context: context,
                          builder: (context) => _DeleteDialog()
                        );
                        if(retorno! && context.mounted) {
                          final usuarioDao = Provider.of<UsuariosDao>(context, listen: false);
                          final resultado = await usuarioDao.deleteUsuario(widget.dadosUsuario!);

                          if(resultado.result == false && context.mounted) {
                            showErrorMessage(context, "Falha ao deletar conta", resultado.message!);
                          } else {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()
                                )
                            );
                          }
                        }
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
}

class _DeleteDialog extends StatefulWidget {
  @override
  _DialogState createState() => _DialogState();
}

class _DialogState extends State<_DeleteDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Deletar sua conta"),
      content: const Text("Você realmente deseja deletar sua conta?"),
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

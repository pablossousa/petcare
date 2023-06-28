import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alterar Usuário'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNomeTextField(context),
              const SizedBox(height: 15),
              _buildCelularTextField(context),
              const SizedBox(height: 15),
              _buildEnderecoTextField(context),
              const SizedBox(height: 15),
              _buildEmailTextField(context),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text('Alterar Dados'),
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
                          celular: d.Value(_celularController.value.text.isEmpty ? widget.dadosUsuario?.celular : _celularController.value.text),
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
                  ElevatedButton(
                    child: const Text('Deletar conta'),
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

  TextField _buildCelularTextField(BuildContext context) {
    return TextField(
      controller: _celularController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Celular',
        border: OutlineInputBorder(),
      ),
    );
  }

  TextField _buildEnderecoTextField(BuildContext context) {
    return TextField(
      controller: _enderecoController,
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
        labelText: 'Endereço',
        border: const OutlineInputBorder(),
        errorText: _enderecoErrorMessage,
      ),
    );
  }

  TextField _buildEmailTextField(BuildContext context) {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'E-mail',
        border: const OutlineInputBorder(),
        errorText: _emailErrorMessage,
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

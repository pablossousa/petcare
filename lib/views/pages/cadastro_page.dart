import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mds/views/components/buildTextField.dart';
import 'package:mds/views/components/show_dialog_message.dart';
import 'package:mds/views/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as d;

import '../../data/database/database.dart';
import 'home_page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _maskFormatter = MaskTextInputFormatter(mask: '(##) #####-####');

  late TextEditingController _nomeController;
  late TextEditingController _celularController;
  late TextEditingController _enderecoController;
  late TextEditingController _emailController;
  late TextEditingController _senhaController;
  late TextEditingController _confirmarController;

  String? _nomeErrorMessage;
  String? _enderecoErrorMessage;
  String? _emailErrorMessage;
  String? _senhaErrorMessage;
  String? _confirmarErrorMessage;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController();
    _celularController = TextEditingController();
    _enderecoController = TextEditingController();
    _emailController = TextEditingController();
    _senhaController = TextEditingController();
    _confirmarController = TextEditingController();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _celularController.dispose();
    _enderecoController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
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
                mainAxisSize: MainAxisSize.max,
                children: [
                  buildTextField(context, _nomeController, TextInputType.text, 'Nome', _nomeErrorMessage),
                  const SizedBox(height: 15),
                  _buildCelularTextField(context),
                  const SizedBox(height: 15),
                  buildTextField(context, _enderecoController, TextInputType.streetAddress, 'Endereço', _enderecoErrorMessage),
                  const SizedBox(height: 15),
                  buildTextField(context, _emailController, TextInputType.emailAddress, 'Email', _emailErrorMessage),
                  const SizedBox(height: 15),
                  _buildSenhaTextField(context),
                  const SizedBox(height: 15),
                  _buildConfirmarTextField(context),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: const Text('Cadastrar'),
                        onPressed: () async {
                          final nome = _nomeController.value.text;
                          final endereco = _enderecoController.value.text;
                          final email = _emailController.value.text;
                          final senha = _senhaController.value.text;
                          final confirmar = _confirmarController.value.text;

                          _nomeErrorMessage = nome.isEmpty ? 'Digite um nome' : null;
                          _enderecoErrorMessage = endereco.isEmpty ? 'Digite um endereço' : null;
                          _emailErrorMessage = email.isEmpty ? 'Digite um email' : null;
                          _senhaErrorMessage = senha.isEmpty ? 'Digite uma senha' : null;
                          _confirmarErrorMessage = confirmar.isEmpty ? 'Confirme sua senha' : null;

                          if(_nomeErrorMessage == null && _enderecoErrorMessage == null
                            && _emailErrorMessage == null && _senhaErrorMessage == null
                            && _confirmarErrorMessage == null) {
                            _senhaErrorMessage = senha.length < 4 ? 'Senha deve ter pleo menos 4 caracteres' : null;
                            _confirmarErrorMessage = senha != confirmar ? 'Confirmar senha deve ser igual a senha' : null;

                            if(_senhaErrorMessage == null && _confirmarErrorMessage == null) {
                              final encrypted = Crypt.sha256(senha, salt: 'hEyfewV6codPfHzpuKochQctsxrPkYBz').toString();

                              final usuarioDao = Provider.of<UsuariosDao>(context, listen: false);
                              final response = await usuarioDao.cadastrarUsuario(UsuariosCompanion(
                                nome: d.Value(_nomeController.value.text),
                                celular: d.Value(_maskFormatter.getMaskedText().isEmpty ? null : _maskFormatter.getMaskedText()),
                                endereco: d.Value(_enderecoController.value.text),
                                email: d.Value(_emailController.value.text),
                                senha: d.Value(encrypted),
                              ));

                              if(response.result == null && context.mounted) {
                                showErrorMessage(context, 'Falha ao fazer cadastro de usuário', response.message!);
                              } else {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(dadosUsuario: response.result,)
                                  )
                                );
                              }
                            }
                          }
                          setState(() {});
                        },
                      ),
                      TextButton(
                        child: const Text('Login'),
                        onPressed: () => {Navigator.pushReplacement(context, MaterialPageRoute(
                          builder:(context) => const LoginPage(),
                        ))},
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      )
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
      inputFormatters: [
        _maskFormatter
      ],
    );
  }

  TextField _buildSenhaTextField(BuildContext context) {
    return TextField(
      controller: _senhaController,
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Senha',
        border: const OutlineInputBorder(),
        errorText: _senhaErrorMessage,
      ),
      onChanged: (value) {
        _senhaErrorMessage = value.length < 4 ? 'Senha deve ter pelo menos 4 caracteres' : null;
        setState(() {});
      },
    );
  }

  TextField _buildConfirmarTextField(BuildContext context) {
    return TextField(
      controller: _confirmarController,
      obscureText: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: 'Confirmar Senha',
        border: const OutlineInputBorder(),
        errorText: _confirmarErrorMessage,
      ),
      onChanged: (value) {
        _confirmarErrorMessage = value != _senhaController.value.text ? 'Confirmar senha deve ser igual a senha' : null;
        setState(() {});
      },
    );
  }
}

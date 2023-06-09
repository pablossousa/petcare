import 'package:flutter/material.dart';
import 'package:mds/views/pages/home_page.dart';
import 'package:provider/provider.dart';

import '../../data/database/database.dart';
import 'cadastro_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _senhaController;

  String? _erroEmailText;
  String? _erroSenhaText;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _senhaController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
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
      title: const Text('Falha ao fazer login'),
      content: const Text('Usuário com email e senha passados não encontrado'),
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
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildEmailTextField(context),
            const SizedBox(height: 15),
            _buildSenhaTextField(context),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('Entrar'),
                  onPressed: () async {
                    final email = _emailController.value.text;
                    final senha = _senhaController.value.text;

                    _erroEmailText = email.isEmpty ? 'Digite um email' : null;
                    _erroSenhaText = senha.isEmpty ? 'Digite uma senha' : null;

                    if(_erroEmailText == null && _erroSenhaText == null) {
                      _erroSenhaText = senha.length < 4 ? 'Senha deve ter pelo menos 4 caracteres' : null;

                      if(_erroSenhaText ==  null) {
                        final usuarioDao = Provider.of<UsuariosDao>(context, listen: false);
                        final usuario = (await usuarioDao.findUsuario(email, senha)).firstOrNull;

                        if(usuario ==  null && context.mounted) {
                          _showErrorMessage(context);
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder:(context) => HomePage(dadosUsuario: usuario,)
                            )
                          );
                        }
                      }
                    }
                    setState(() {});
                  },
                ),
                TextButton(
                  child: const Text('Cadastrar'),
                  onPressed: () => {Navigator.pushReplacement(context, MaterialPageRoute(
                    builder:(context) => CadastroPage(),
                  ))},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextField _buildEmailTextField(BuildContext context) {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'E-mail',
        border: OutlineInputBorder(),
        errorText: _erroEmailText,
      ),
    );
  }

  TextField _buildSenhaTextField(BuildContext context) {
    return TextField(
      controller: _senhaController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Senha',
        border: OutlineInputBorder(),
        errorText: _erroSenhaText,
      ),
      onChanged: (value) {
        _erroSenhaText = value.length < 4 ? 'Senha deve ter pelo menos 4 caracteres' : null;
        setState(() {});
      },
    );
  }
}

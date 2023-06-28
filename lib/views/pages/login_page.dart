import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:mds/views/components/buildTextField.dart';
import 'package:mds/views/components/show_dialog_message.dart';
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
            buildTextField(context, _emailController, TextInputType.emailAddress, 'Email', _erroEmailText),
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
                        final encrypted = Crypt.sha256(senha, salt: 'hEyfewV6codPfHzpuKochQctsxrPkYBz').toString();

                        final usuarioDao = Provider.of<UsuariosDao>(context, listen: false);
                        final usuario = await usuarioDao.findUsuario(email, encrypted);

                        if(usuario.result == null && context.mounted) {
                          showErrorMessage(context, 'Falha ao fazer login', usuario.message!);
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder:(context) => HomePage(dadosUsuario: usuario.result,)
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
                    builder:(context) => const CadastroPage(),
                  ))},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextField _buildSenhaTextField(BuildContext context) {
    return TextField(
      controller: _senhaController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Senha',
        border: const OutlineInputBorder(),
        errorText: _erroSenhaText,
      ),
      onChanged: (value) {
        _erroSenhaText = value.length < 4 ? 'Senha deve ter pelo menos 4 caracteres' : null;
        setState(() {});
      },
    );
  }
}

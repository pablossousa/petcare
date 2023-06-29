import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(top: 100, left: 40, right: 40),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromARGB(255, 68, 132, 140), Color.fromARGB(255, 92, 156, 148), Color.fromARGB(224, 140, 172, 164)]
            )
          ),
          child: ListView(
            children: <Widget> [
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset("assets/imgs/PET CARE.png"),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "PET CARE",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Digite o seu email",
                  labelText: "Digite o seu email",
                  labelStyle: const TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
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
                  errorText: _erroEmailText,
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
                  if(_erroEmailText != null) {
                    _erroEmailText = null;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _senhaController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Digite a sua senha",
                  labelText: "Digite a sua senha",
                  labelStyle: const TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
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
                  errorText: _erroSenhaText,
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
                  _erroSenhaText = value.length < 4 ? 'Senha deve ter pelo menos 4 caracteres' : null;
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 68, 132, 140),
                  minimumSize: const Size.fromHeight(60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))
                ),
                child: const Text(
                  "ENTRAR",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
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
              Container(
                height: 40,
                alignment: Alignment.center,
                child: TextButton(
                  child: const Text(
                    "Cadastre-se",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ),
                  ),
                  onPressed: () => {Navigator.pushReplacement(context, MaterialPageRoute(
                    builder:(context) => const CadastroPage(),
                  ))},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:petcare/cadastro_usuario.dart';

import 'menu.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: (text) {
                  email = text;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: 'E-mail', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 15),
              TextField(
                onChanged: (text) {
                  password = text;
                },
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Senha', border: OutlineInputBorder()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // if (email == 'teste@gmail.com' && password == '123') {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Menu()),
                      );
                      //} else {
                      //print('Inválido');
                      //}
                    },
                    child: const Text('Entrar'),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const CadastroPage()),
                        );
                      },
                      child: const Text('Cadastrar')),
                ],
              ),
              OutlinedButton(
                  onPressed: () {}, child: const Text('Esqueci minha senha'))
            ],
          ),
        ),
      ),
    );
  }
}

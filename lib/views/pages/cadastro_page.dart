import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cadastrar-se'),
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
                    //buildTextField(context, _nomeController, TextInputType.text, 'Nome', _nomeErrorMessage),
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
                    //_buildCelularTextField(context),
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
                    //buildTextField(context, _enderecoController, TextInputType.streetAddress, 'Endereço', _enderecoErrorMessage),
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
                    //buildTextField(context, _emailController, TextInputType.emailAddress, 'Email', _emailErrorMessage),
                    const SizedBox(height: 15),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Digite uma senha",
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
                          controller: _senhaController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
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
                            errorText: _senhaErrorMessage,
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
                            _senhaErrorMessage = value.length < 4 ? 'Senha deve ter pelo menos 4 caracteres' : null;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    //_buildSenhaTextField(context),
                    const SizedBox(height: 15),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Confirme a senha",
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
                          controller: _confirmarController,
                          keyboardType: TextInputType.text,
                          obscureText: true,
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
                            errorText: _senhaErrorMessage,
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
                            _confirmarErrorMessage = value != _senhaController.value.text ? 'Confirmar senha deve ser igual a senha' : null;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    //_buildConfirmarTextField(context),
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
                        "CADASTRAR",
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
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
                    Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: TextButton(
                        child: const Text(
                          "Fazer login",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16
                          ),
                        ),
                        onPressed: () => {Navigator.pushReplacement(context, MaterialPageRoute(
                          builder:(context) => const LoginPage(),
                        ))},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}

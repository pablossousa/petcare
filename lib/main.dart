import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mds/data/database/database.dart';
import 'package:provider/provider.dart';
import 'package:mds/routes/app_routes.dart';
import 'package:drift/drift.dart' as d;

void main() => runApp(const MyApp());
//teste
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final database = AppDatabase();
    database.usuariosDao.cadastrarUsuario(const UsuariosCompanion(
      nome: d.Value('Gabriel Teixeira Júlio'),
      email: d.Value('teste@teste'),
      celular: d.Value('123456789'),
      endereco: d.Value('endereço 1'),
      senha: d.Value('senh@123'),
    ));
    database.vacinasDao.insertVacina(const VacinasCompanion(
      nome: d.Value('Vacina Teste'),
      descricao: d.Value('Vacina para MVP'),
      periodoDoses: d.Value('Vacina de teste')
    ));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        Provider(create: (context) => database.usuariosDao),
        Provider(create: (context) => database.petsDao),
        Provider(create: (context) => database.anamnesesDao),
        Provider(create: (context) => database.vacinasDao),
        Provider(create: (context) => database.vacinacaosDao)
      ],
      child: MaterialApp(
        title: 'Pet Care',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Montserrat',
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.login,
        routes: AppRoutes.routes,
      ),
    );

  }
}

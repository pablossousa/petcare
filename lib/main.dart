import 'package:crypt/crypt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mds/data/database/database.dart';
import 'package:provider/provider.dart';
import 'package:mds/routes/app_routes.dart';
import 'package:drift/drift.dart' as d;

import 'dart:convert';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final database = AppDatabase();
    fillDatabase(database);

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

  void fillDatabase(AppDatabase database) async {
    if((await database.usuariosDao.countUsuarios())! == 0) {
      database.usuariosDao.cadastrarUsuario(UsuariosCompanion(
        nome: d.Value('Gabriel Teixeira Júlio'),
        email: d.Value('teste@teste'),
        celular: d.Value('123456789'),
        endereco: d.Value('endereço 1'),
        senha: d.Value(Crypt.sha256('senh@123', salt: 'hEyfewV6codPfHzpuKochQctsxrPkYBz').toString()),
      ));
    }
    if((await database.vacinasDao.countVacinas())! == 0) {
      final String response = await rootBundle.loadString('lib/data/dados/vacinas.json');
      final data = await json.decode(response);

      for(var vacina in data) {
        database.vacinasDao.insertVacina(VacinasCompanion(
            nome: d.Value(vacina['nome']),
            descricao: d.Value(vacina['descricao']),
            periodoDoses: d.Value(vacina['periodoDoses'])
        ));
      }
    }
  }
}

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
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.login,
        routes: AppRoutes.routes,
      ),
    );

  }

  void fillDatabase(AppDatabase database) async {
    if((await database.vacinasDao.countVacinas())! == 0) {
      final String response = await rootBundle.loadString('assets/dados/vacinas.json');
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

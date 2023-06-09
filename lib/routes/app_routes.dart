import 'package:mds/views/pages/home_page.dart';
import 'package:mds/views/pages/login_page.dart';
import 'package:mds/views/pages/cadastro_page.dart';

abstract class AppRoutes {
  static const String home = 'HOME';
  static const String login = 'LOGIN';
  static const String cadastro = 'CADASTRO';

  static final routes = {
    home: (context) => HomePage(),
    login: (context) => LoginPage(),
    cadastro: (context) => CadastroPage(),
  };
}
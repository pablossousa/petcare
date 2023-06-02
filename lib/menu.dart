import 'package:flutter/material.dart';

import 'package:petcare/cadastro_pet.dart';
import 'package:petcare/perfil_pet.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() {
    return MenuState();
  }
}

class MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.account_circle_rounded),
        title: const Text('Nome usuário'),
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            child: ListTile(
              leading: const Icon(Icons.pets),
              title: const Text('Nome pet'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PerfilPet()),
                );
              },
            ),
          ),
          GestureDetector(
            child: ListTile(
              leading: const Icon(Icons.pets),
              title: const Text('Nome pet'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PerfilPet()),
                );
              },
            ),
          ),
          GestureDetector(
            child: ListTile(
              leading: const Icon(Icons.pets),
              title: const Text('Nome pet'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PerfilPet()),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const CadastroPet()),
          );
        },
      ),
    );
  }
}










// import 'package:flutter/material.dart';

// import 'package:petcare/cadastro_pet.dart';

// class Menu extends StatefulWidget {
//   @override
//   State<Menu> createState() {
//     return MenuState();
//   }
// }

// class MenuState extends State<Menu> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.account_circle_rounded),
//         title: Text('Usuário'),
//       ),
//       body: ListView(
//         children: const <Widget>[
//           ListTile(
//             leading: Icon(Icons.pets),
//             title: Text('Nome pet'),
//           ),
//           ListTile(
//             leading: Icon(Icons.pets),
//             title: Text('Nome pet'),
//           ),
//           ListTile(
//             leading: Icon(Icons.pets),
//             title: Text('Nome pet'),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(builder: (context) => CadastroPet()),
//           );
//         },
//       ),
//     );
//   }
// }

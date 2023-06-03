import 'package:flutter/material.dart';
import 'package:petcare/vacina.dart';

class CartaoVacina extends StatefulWidget {
  const CartaoVacina({super.key});

  @override
  State<CartaoVacina> createState() => _CartaoVacinaState();
}

class _CartaoVacinaState extends State<CartaoVacina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartão de Vacina'),
      ),
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 20,
          ),
          const Text(
            'Controle de Vacinação',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Vacina()),
              );
            },
            child: const Column(
              children: [
                ListTile(
                  title: Text(
                    'Vacina:',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Dose:',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Data:',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                ListTile(
                  title: Text(
                    'Revacina:',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 20,
                ),
              ],
            ),
          ),
            const Text(
              'Controle de Parasitas',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const ListTile(
              title: Text(
                'Vermífugo:',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const ListTile(
              title: Text(
                'Peso:',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const ListTile(
              title: Text(
                'Data:',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const ListTile(
              title: Text(
                'Revacina:',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Download'),
            ),
        ],
      ),
    );
  }
}

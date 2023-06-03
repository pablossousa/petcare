import 'package:flutter/material.dart';

class Anamnese extends StatefulWidget {
  const Anamnese({super.key});

  @override
  State<Anamnese> createState() => _AnamneseState();
}

class _AnamneseState extends State<Anamnese> {
  bool? isChecked = false, isChecked2 = false, isChecked3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Anamnese'),
        ),
        body: ListView(
          children: [
            const ListTile(
              title: Text(
                'Queixa Principal',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                )),
            const ListTile(
              title: Text(
                'Alimentação',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                )),
            const ListTile(
              title: Text(
                'Doenças Anteriores',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                )),
            const ListTile(
              title: Text(
                'Tempo Evolução',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                )),
            const ListTile(
              title: Text(
                'Tipo Evolução',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                )),
            const ListTile(
              title: Text(
                'Ambiente ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                )),
            CheckboxListTile(
                title: const Text(
                  'Fugiu Recentemente',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                value: isChecked,
                activeColor: Colors.cyan,
                onChanged: (newBool) {
                  setState(() {
                    isChecked = newBool;
                  });
                }),
            CheckboxListTile(
                title: const Text(
                  'Pulgas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                value: isChecked2,
                activeColor: Colors.cyan,
                onChanged: (newBool) {
                  setState(() {
                    isChecked2 = newBool;
                  });
                }),
            CheckboxListTile(
                title: const Text(
                  'Carrapatos',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                value: isChecked3,
                activeColor: Colors.cyan,
                onChanged: (newBool) {
                  setState(() {
                    isChecked3 = newBool;
                  });
                }),
            const ListTile(
              title: Text(
                'Vacina',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Ex: Antirrábica',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                )),
            const ListTile(
              title: Text(
                'Vermifugação',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Ex: 15 dias',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                  ),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Download'),
                )
              ],
            )
          ],
        )
        );
  }
}

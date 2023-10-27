
import 'package:flutter/material.dart';

void main() {
  runApp(TabuadaApp());
}

class TabuadaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.brown[400],
        hintColor: Colors.brown[200],
        scaffoldBackgroundColor: Colors.brown[100],
      ),
      home: TabuadaScreen(),
    );
  }
}

class TabuadaScreen extends StatefulWidget {
  @override
  _TabuadaScreenState createState() => _TabuadaScreenState();
}

class _TabuadaScreenState extends State<TabuadaScreen> {
  final TextEditingController _numeroController = TextEditingController();
  List<String> tabuada = [];

  void calcularTabuada(double numero) {
    tabuada.clear();
    for (int i = 0; i <= 10; i++) {
      tabuada.add('$numero x $i = ${numero * i}');
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('⋆˙⟡♡  tabuada⋆˙⟡♡'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite um número',
                labelStyle: TextStyle(color: Colors.brown[300]),
              ),
              style: TextStyle(color: Colors.brown[900]),
            ),
            ElevatedButton(
              onPressed: () {
                double numero = double.tryParse(_numeroController.text) ?? 0;
                calcularTabuada(numero);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown[400],
              ),
              child: Text(
                'Calcular Tabuada',
                style: TextStyle(color: Colors.brown[100]),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tabuada.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.brown[200],
                    elevation: 2.0,
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        tabuada[index],
                        style: TextStyle(
                          color: Colors.brown[800],
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

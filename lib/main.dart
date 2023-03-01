import 'package:flutter/material.dart'; // Estilizacao padrao; Android

void main() {
  // Metodo que Starta a aplicacao
  //     Primeiro widget
  runApp(const MyApp()); // Prepara o Flutter
}

//                  Sem estado
class MyApp extends StatelessWidget {
  // Construtor
  const MyApp({super.key});

  @override // Todo widget tera um metodo build, ele e responsavel por desenhar o mesmo
  //          Contexto da APP
  Widget build(BuildContext context) {
    // Retorna o primeiro widget
    return MaterialApp(
      // Barra de 'debug'
      debugShowCheckedModeBanner: false,
      // Nome do app na dock
      title: 'FFA',
      // Tema Principal
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      //   Primeira page     Titulo na AppBar
      home: const MyHomePage(title: 'First Flutter App'),
    );
  }
}

// Primeira page         // Possui estado
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override // Classe privada internamente, para gerenciar estado - (todo StatefulWidget vai ter a classe padrao e a classe privada)
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    // Metodo para mudar estado da App
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    // Metodo para mudar estado da App
    setState(() {
      _counter = _counter - 1;
    });
  }

  @override // Geralmente e aqui que e construido o App
  Widget build(BuildContext context) {
    // Widget principal "Base da App"
    return Scaffold(
      // Segundo Widget "Cabeca da App"
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Terceiro Widget "Corpo da App"
      body: Center(
        // Quarto Widget "Coluna da App", ele aceita diversos childrens "filhos"
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //  Lista de Widgets
          children: <Widget>[
            const Text(
              'Total:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(
              Icons.minimize,
            ),
            backgroundColor: Colors.red,
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

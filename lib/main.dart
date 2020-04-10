//PROJETO 1 - CURSO TREINA WEB - VERSÃO 3
//última atualização em 08/04/2020

import 'package:flutter/material.dart';

//Classe da aplicação
class TreinaWebFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "TreinaWeb Flutter",
      theme: new ThemeData(
        primarySwatch: Colors.cyan
      ),
      home: new PaginaPrincipalPage(),
    );
  }
}

// Classe da página principal
//Boas práticas: criar uma classe para cada página da aplicação.
//Nessa aplicação há apenas uma página principal.
class PaginaPrincipalPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _PaginaPrincipalState();    
  }
  // Alternativa (com notação Lambda): 
  // @override
  // State<StatefulWidget> createState() => new _PaginaPrincipalState();
}

// Estado da página principal
//"_" = private
class _PaginaPrincipalState extends State<PaginaPrincipalPage> { // a classe _PaginaPrincipalState é visível apenas no main.dart devido ao "_"
  double _numero1 = 0.0;
  double _numero2 = 0.0;
  double _resultadoAdicao = 0.0;
  double _resultadoSubtracao = 0.0;

  void _setNumero1(String valor) {
    setState(() {
      try {
        _numero1 = double.parse(valor);
        _resultadoAdicao = _numero1 + _numero2;
        _resultadoSubtracao = _numero1 - _numero2;
      } catch (ex) {
        // TODO: notificar usuário
      }
    });
  }

  void _setNumero2(String valor) {
    setState(() {
      try {
        _numero2 = double.parse(valor);
        _resultadoAdicao = _numero1 + _numero2;
        _resultadoSubtracao = _numero1 - _numero2;
      } catch (ex) {
        // TODO: notificar usuário
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('TreinaWeb - Flutter'),        
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                labelText: "Primeiro número:"
              ),
              keyboardType: TextInputType.number,
              onChanged: (valor) {
                _setNumero1(valor);
              },
            ),

            new TextField(
              decoration: new InputDecoration(
                labelText: "Segundo número:"
              ),
              keyboardType: TextInputType.number,
              onChanged: (valor) {
                _setNumero2(valor);
              },
            ),

            new Text(
              "- Adição: $_resultadoAdicao \n - Subtração: $_resultadoSubtracao",
              style: new TextStyle(
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center
            )
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(new TreinaWebFlutterApp());
}
//Outra maneira (com expressão "Lambda"):
//void main() => runApp(new TreinaWebFlutterApp());


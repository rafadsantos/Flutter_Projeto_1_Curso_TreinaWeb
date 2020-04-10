//PROJETO 1 - CURSO TREINA WEB - VERSÃO 2
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

//Boas práticas: criar uma classe para cada página da aplicação.
//Nessa aplicação há apenas uma página principal.
class PaginaPrincipalPage extends StatelessWidget {
  double numero1 = 0.0;
  double numero2 = 0.0;

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
                try {
                  numero1 = double.parse(valor);
                } catch (ex) {
                  numero1 = 0.0;
                }
              },
            ),

            new TextField(
              decoration: new InputDecoration(
                labelText: "Segundo número:"
              ),
              keyboardType: TextInputType.number,
              onChanged: (valor) {
                try {
                  numero2 = double.parse(valor);
                } catch (ex) {
                  numero2 = 0.0;
                }
              },
            ),

            new RaisedButton(
              child: new Text('Calcular'),
              onPressed: () {
                double adicao = numero1 + numero2;
                double subtracao = numero1 - numero2;
                showDialog(
                  context: context,
                  builder: (BuildContext context) { //propriedade child não será mais utilizada futuramente (deprecated)
                    return new AlertDialog(
                      title: new Text("Resultados"),
                      content: new Text(" - Adição: $adicao \n - Subtração: $subtracao")
                    );
                  }
                );                
              },
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
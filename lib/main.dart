//última alteração em 08/04/2020

import 'package:flutter/material.dart';

class TreinaWebFlutter extends StatelessWidget { //não salva estados.
  double numero1 = 0.0;
  double numero2 = 0.0;

  @override // anotation, não é obrigatório, utilizado por questões de clareza.
  Widget build(BuildContext context) { //método sobrescrito da classe StatelessWidget.
    //Primeiro input
    TextField primeiroNumeroField = new TextField(
      decoration: InputDecoration(
        labelText: 'Primeiro número'
      ),
      keyboardType: TextInputType.number,
      onChanged: (valor) {
        try {
          numero1 = double.parse(valor);
        } catch (ex) {
          numero1 = 0.0;
        }
      },
    );

    //Segundo input
    TextField segundoNumeroField = new TextField(
      decoration: InputDecoration(
        labelText: 'Segundo número'
      ),
      keyboardType: TextInputType.number,
      onChanged: (valor) {
        try {
          numero2 = double.parse(valor);
        } catch (ex) {
          numero2 = 0.0;
        }
      },
    );

    //Botão de cálculo
    RaisedButton calcularButton = new RaisedButton(
      child: new Text('Calcular'),
      onPressed: () {
        double adicao = numero1 + numero2;
        double subtracao = numero1 - numero2;
        AlertDialog resultadoDialog = new AlertDialog(
          content: new Text("Resultados: adição = $adicao - Subtração = $subtracao")
        );
        showDialog(context: context, child: resultadoDialog);
      },
    );

    //container para agrupar os widgets criados.
    Container container = new Container(
      padding: EdgeInsets.all(20.0), //margem
      child: new Column(
        children: <Widget>[primeiroNumeroField, segundoNumeroField, calcularButton],
      ),
    );

    AppBar appBar = new AppBar(
      title: new Text('TrienaWeb - Flutter (definido no title do AppBar'),
    );

    //"coordenador" de layouts.
    Scaffold scaffold = new Scaffold(
      appBar: appBar,
      body: container,
    );
       
    return scaffold;
  }
}

void main() {
  runApp(new MaterialApp(
    title: 'TreinaWeb Flutter (definido no title do runApp)',
    home: new TreinaWebFlutter()
  ));
}


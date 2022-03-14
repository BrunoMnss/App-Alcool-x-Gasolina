import 'dart:ffi';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();

  TextEditingController _controllerGasolina = TextEditingController();

  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
            "Número invalido, Digite numeros maiores que 0 e faça a utilização do (.)!";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado =
              "Com base nas informações acredito ser melhor abastecer com Gasolina!";
        });
      } else {
        setState(() {
          _textoResultado =
              "Com base nas informações acredito ser melhor abastecer com Alcool!";
        });
      }

      /* setState(() {
        _textoResultado = "Numero valido, estamos realizando o calculo || " +
            "Preço Alcool ~ " +
            _controllerAlcool.text +
            " || " +
            "Preço Gasolina ~ " +
            _controllerGasolina.text;
      });
      */

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abasteço Alcool ou Gasolina?"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Image.asset(
                    "images/1.png",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    "Vamos descobrir qual será a melhor opção para abastecimento do seu carro.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço do Alcool (Ex: 2.32)",
                  ),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  controller: _controllerAlcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço da Gasolina (Ex: 4.35)",
                  ),
                  style: TextStyle(fontSize: 20),
                  controller: _controllerGasolina,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                      color: Colors.amber,
                      padding: EdgeInsets.only(right: 30, left: 30),
                      child: Text(
                        "Calcular",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      onPressed: _calcular),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _textoResultado,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}

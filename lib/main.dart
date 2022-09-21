import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controlaPeso = new TextEditingController();
  TextEditingController controlaAltura = new TextEditingController();
  String info = " ";
  String msg = " ";
  String msgFinal = " ";
  void _resetFields(){
    controlaPeso.text = " ";
    controlaAltura.text = " ";
    setState(() {
      info = " ";
      msgFinal = " ";
    });
  }
  void calculaImc(){
    setState(() {
      double peso = double.parse(controlaPeso.text);
      double altura = double.parse(controlaAltura.text);
      double imc = peso/(altura*altura);
      info = "IMC = $imc";
      if(imc<18.5){
        msg = "abaixo do peso";
      } else if(imc>18.5 && imc<24.9){
        msg = "com o peso normal";
      }else if(imc>25 && imc<29.9){
        msg = "um pouco acima do peso";
      }else if(imc>30 && imc<34.9){
        msg = "Com obesidade";
      }else if(imc>35 && imc<39.9){
        msg = "Com obesidade severa";
      }else if(imc>40){
        msg = "Com obesidade morbida";
      }
      msgFinal = "Seu IMC é de ${imc.toStringAsPrecision(4)}, voce esta $msg";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
            onPressed: _resetFields,)
        ],
      ),
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person_outline, size:120.0, color: Colors.green),
          TextField(keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Peso em kg",
              labelStyle: TextStyle(color: Colors.green)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25),
            controller: controlaPeso,
          ),
          TextField(keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Altura em metros",
                labelStyle: TextStyle(color: Colors.green)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25),
            controller: controlaAltura,
          ),
         Container(
             height: 50,
             child: RaisedButton(
              onPressed: calculaImc,
              child: Text("Calcular",
                  style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              color: Colors.green,
              ),
            ),
          Text(msgFinal,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.green,
                fontSize:50
            ),
          ),
        ],
      ),
    ),
    );
  }
}

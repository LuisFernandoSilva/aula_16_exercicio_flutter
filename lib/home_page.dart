import 'package:aula_16_exercicio_flutter/card.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

CardBuild card = CardBuild();
GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
var nameController = TextEditingController();
String name = '';
String numberCard = randomNumeric(16);

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cartão do Nubank'),
        backgroundColor: Color.fromRGBO(153, 51, 153, .5),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.credit_card),
              onPressed: () => cardKey.currentState.toggleCard()),
        ],
      ),
      backgroundColor: Color.fromRGBO(153, 51, 153, .5),
      //TODO: tentei usar uma classe e trazer o cartao pronto dela,
      /*tb tentei fazer uma classe forms pra trazer uma forms e tal porem nao via o setState, 
      acabei fazendo na home funciona,  porem nao esta aquela soluçao clean como queria e acabou não funcioando*/
      body: FlipCard(
        key: cardKey,
        flipOnTouch: false,
        direction: FlipDirection.HORIZONTAL,
        front: Stack(
          children: <Widget>[
            card(),
            topRight('assets/mastercard.png'),
            midLeft('assets/chip.png'),
            midLeftColor(130, 75, 'assets/nfc.png', 20, Colors.white),
            midLeftColor(30, 30, 'assets/nu_logo.png', 90, Colors.white),
            //TODO:tentei nao usar o container par posicionar o textfield mas nao consegui
            Positioned(
              child: Container(
                margin: EdgeInsets.fromLTRB(130, 130, 50, 50),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.text,
                  controller: nameController,
                  onChanged: (value) {
                    name = nameController.text;
                  },
                ),
              ),
            ),
          ],
        ),
        back: Stack(
          children: <Widget>[
            card(),
            Positioned(
                bottom: 120,
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: 340,
                  height: 60,
                  color: Colors.white,
                )),
            Positioned(
                top: 140,
                left: 40,
                child: Text(
                  numberCard,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )),
            Positioned(
                top: 125,
                right: 20,
                child: Image.asset(
                  'assets/cirrus.png',
                  width: 60,
                )),
            Positioned(
              top: 160,
              left: 100,
              child: RaisedButton.icon(
                  onPressed: () {
                    setState(() {
                      numberCard = randomNumeric(16);
                    });
                  },
                  icon: Icon(Icons.fiber_new),
                  label: Text('Numero')),
            ),
          ],
        ),
      ),
    );
  }

  Widget card() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 200,
      width: 350,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(109, 33, 119, 1)),
    );
  }

//posiçao imagens frente
  Widget topRight(String topImage) {
    return Positioned(
        bottom: 150,
        right: 10,
        child: Image.asset(
          topImage,
          width: 80,
        ));
  }

  Widget midLeft(String midImage) {
    return Positioned(
        bottom: 125, left: 30, child: Image.asset(midImage, width: 40));
  }

  Widget midLeftColor(double posBottom, double posleft, String midImage,
      double imgWidth, Color imgColor) {
    return Positioned(
        bottom: posBottom,
        left: posleft,
        child: Image.asset(
          midImage,
          width: imgWidth,
          color: imgColor,
        ));
  }
}

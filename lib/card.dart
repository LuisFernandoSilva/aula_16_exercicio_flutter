import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class CardBuild {
  var nameController = TextEditingController();
  String name = '';
  String numberCard = randomNumeric(16);
  Widget buildCard(GlobalKey<FlipCardState> cardKey) {
    return FlipCard(
        key: cardKey,
        flipOnTouch: false,
        direction: FlipDirection.HORIZONTAL,
        front: Stack(
          children: <Widget>[
            card(),
            topRight('assets/mastercard.png'),
            midLeft('assets/chip.png'),
            midLeftColor(105, 75, 'assets/nfc.png', 20, Colors.white),
            midLeftColor(10, 30, 'assets/nu_logo.png', 90, Colors.white),
            Positioned(
                bottom: 40,
                left: 120,
                child: Text(
                  name,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          ],
        ),
        back: Stack(children: <Widget>[
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
                  numberCard = randomNumeric(16);
                },
                icon: Icon(Icons.fiber_new),
                label: Text('Numero')),
          ),
        ]));
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
        bottom: 140,
        right: 10,
        child: Image.asset(
          topImage,
          width: 80,
        ));
  }

  Widget midLeft(String midImage) {
    return Positioned(
        bottom: 100, left: 30, child: Image.asset(midImage, width: 40));
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

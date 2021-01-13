import 'dart:ui';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'constants.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Doge Miner'),
          backgroundColor: Colors.deepPurple,
        ),
        body: CoinPage(),
      ),
    ),
  );
}

class CoinPage extends StatefulWidget {
  @override
  _CoinPageState createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  num dogeCoins = 0;
  num multiplier = 1;

  @override
  Widget build(BuildContext context) {
    bool isEnabled = false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          'DogeCoins: ' + num.parse(dogeCoins.toStringAsFixed(4)).toString(),
          style: TextStyle(
            fontSize: 23,
          ),
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 80.0),
          child: Text(
            'Multiplier: ' +
                num.parse(multiplier.toStringAsFixed(2)).toString(),
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
              child: RaisedButton(
                disabledColor: Colors.deepPurple,
                onPressed: () {
                  if (dogeCoins >= kUpgrade1Price) {
                    setState(() {
                      dogeCoins -= kUpgrade1Price;
                      multiplier = kUpgrade1Multiplier;
                    });
                  } else {
                    showAlertDialog(context);
                  }
                },
                child: Text('$kUpgrade1Multiplier' + 'x'),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
              child: RaisedButton(
                onPressed: () {
                  if (dogeCoins >= kUpgrade2Price) {
                    setState(() {
                      dogeCoins -= kUpgrade2Price;
                      multiplier = kUpgrade2Multiplier;
                    });
                  } else {
                    showAlertDialog(context);
                  }
                },
                child: Text('$kUpgrade2Multiplier' + 'x'),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
              child: RaisedButton(
                onPressed: () {
                  if (dogeCoins >= kUpgrade3Price) {
                    setState(() {
                      dogeCoins -= kUpgrade3Price;
                      multiplier = kUpgrade2Multiplier;
                    });
                  } else {
                    showAlertDialog(context);
                  }
                },
                child: Text('$kUpgrade3Multiplier' + 'x'),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
              child: Text('$kUpgrade1Price' + ' DogeCoins'),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
              child: Text('$kUpgrade2Price' + ' DogeCoins'),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
              child: Text('$kUpgrade3Price' + ' DogeCoins'),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 30.0),
          child: BouncingWidget(
            duration: Duration(milliseconds: 100),
            scaleFactor: 1.3,
            onPressed: () {
              setState(() {
                dogeCoins += multiplier;
              });
            },
            child: Image.asset(
              'images/doge_coin.png',
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ],
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Insufficient Funds!"),
    content: Text("You don't have enough DogeCoins to purchase this upgrade."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

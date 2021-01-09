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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 0),
          child: Text(
            'DogeCoins: ' + num.parse(dogeCoins.toStringAsFixed(4)).toString(),
            style: TextStyle(
              fontSize: 23,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  multiplier = 1.3;
                },
                child: Text('1.3x'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  multiplier = 1.5;
                },
                child: Text('1.5x'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  multiplier = 2;
                },
                child: Text('2x'),
              ),
            ),
          ],
        ),
        Expanded(
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: FlatButton(
              onPressed: (){
                setState(() {
                  dogeCoins += multiplier;
                });
              },
              padding: EdgeInsets.all(0.0),
              child: Image.asset('images/doge_coin.png'),
              splashColor: Colors.amberAccent,
            ),
          ),
        ),
      ],
    );
  }
}

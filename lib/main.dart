import 'package:bilgitesti/constants.dart';
import 'package:flutter/material.dart';
import 'package:bilgitesti/qbank.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> sonuclar = [];
  QVeri q1 = QVeri();

  void qButton({required bool value}) {
    if (q1.qOver() == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler Testi bitirdiniz'),
              actions: <Widget>[
                new TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        q1.qReset();
                        sonuclar = [];
                      });
                    },
                    child: Text('Başa Dön'))
              ],
            );
          });
    } else {
      setState(() {
        q1.getAnswer() == value ? sonuclar.add(correct) : sonuclar.add(wrong);
        q1.nextQ();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                q1.getquestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          children: sonuclar,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                      padding: EdgeInsets.all(12),
                      textColor: Colors.white,
                      color: Colors.red[400],
                      child: Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        qButton(value: false);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: RaisedButton(
                        padding: EdgeInsets.all(12),
                        textColor: Colors.white,
                        color: Colors.green[400],
                        child: Icon(Icons.thumb_up, size: 30.0),
                        onPressed: () {
                          qButton(value: true);
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

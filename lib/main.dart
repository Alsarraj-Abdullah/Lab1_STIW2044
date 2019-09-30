import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

double value = 0;
String img = "assets/images/logo.png";
String result1 = "";
String result2 = "";
final TextEditingController ageField = TextEditingController();
final TextEditingController heightField = TextEditingController();
final TextEditingController weightField = TextEditingController();
int calculateBMR(int w, int h, int a, bool isMale) {
  if (isMale == true) {
    value = (10 * w) + (6.25 * h) - (5 * a) + 5;
  } else if (isMale == false) {
    value = (10 * w) + (6.25 * h) - (5 * a) - 161;
  }
  return value.toInt();
}

String formatToString(int n) {
  return n.toString();
}

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  _HomePage createState() => new _HomePage();
}

class _HomePage extends State<MyApp> {
  void _pressMe() {
    setState(() => result1 = "Your BMR Score is (For Male): " +
        formatToString(calculateBMR(int.parse(weightField.text),
            int.parse(heightField.text), int.parse(ageField.text), true)));
    setState(() => result2 = "Your BMR Score is (For Female): " +
        formatToString(calculateBMR(int.parse(weightField.text),
            int.parse(heightField.text), int.parse(ageField.text), false)));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '(BMR) calculator V1.0 [Beta]',
      home: Scaffold(
          backgroundColor: HexColor("#323639"),
          appBar: AppBar(
            backgroundColor: HexColor("#F83546"),
            title: Text('(BMR) calculator V1.0 [Beta]'),
          ),
          body: Center(
            child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(30.0),
                width: 550,
                height: 850,
                child: Column(children: <Widget>[
                  Image.asset(img,
                      height: 200.0,
                      width: 300.0,
                      alignment: Alignment.topCenter,
                      fit: BoxFit.cover),
                  TextField(
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                      controller: ageField,
                      decoration: InputDecoration(
                          hintText: 'Type your age',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20),
                          counterStyle:
                              TextStyle(color: Colors.grey, fontSize: 16))),
                  TextField(
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                      controller: heightField,
                      decoration: InputDecoration(
                          hintText: 'Type your height in Cm',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20),
                          counterStyle:
                              TextStyle(color: Colors.grey, fontSize: 16))),
                  TextField(
                      maxLength: 3,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                      controller: weightField,
                      decoration: InputDecoration(
                          hintText: 'Type your weight in Kg',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20),
                          counterStyle:
                              TextStyle(color: Colors.grey, fontSize: 16))),
                  CupertinoButton(
                    child: Text("Press Me"),
                    color: HexColor("#F83546"),
                    onPressed: _pressMe,
                  ),
                  SizedBox(height: 30),
                  Text('$result1',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(height: 30),
                  Text('$result2',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ])),
          )),
    );
  }
}

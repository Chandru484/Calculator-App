import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double size = 0;
  String inputValue = "";
  String calculatedValue = "";
  String operator = "";

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 5;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                inputValue,
                style: TextStyle(color: Colors.white, fontSize: 100),
              ),
            ),

            Column(
              children: [
                Row(
                  children: [
                    calcbutton("7", Colors.white54),
                    calcbutton("8", Colors.white54),
                    calcbutton("9", Colors.white54),
                    calcbutton("/", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcbutton("4", Colors.white54),
                    calcbutton("5", Colors.white54),
                    calcbutton("6", Colors.white54),
                    calcbutton("*", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcbutton("1", Colors.white54),
                    calcbutton("2", Colors.white54),
                    calcbutton("3", Colors.white54),
                    calcbutton("-", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcbutton("0", Colors.white54),
                    calcbutton(".", Colors.white54),
                    calcbutton("=", Colors.orange),
                    calcbutton("+", Colors.orange),
                  ],
                ),
              ],
            ),
            calcbutton("Clear", Colors.black),
          ],
        ),
      ),
    );
  }

  Widget calcbutton(String text, Color bgColor) {
    return InkWell(
      onTap: () {
        if (text == "Clear") {
          setState(() {
            inputValue = "";
            calculatedValue = "";
            operator = "";  
          });
        } else if (text == "+" || text == "-" || text == "*" || text == "/") {
          calculatedValue = inputValue;
          inputValue = "";
          operator = text;
        } else if (text == "=") {
          setState(() {
            double calc = double.parse(calculatedValue);
            double input = double.parse(inputValue);

            if (operator == "+") {
              inputValue = (calc + input).toString();
            } else if (operator == "-") {
              inputValue = (calc - input).toString();
            } else if (operator == "*") {
              inputValue = (calc * input).toString();
            } else if (operator == "/") {
              inputValue = (calc / input).toString();
            }
          });
        } else {
          setState(() {
            inputValue = inputValue + text;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: EdgeInsets.all(10),
        height: size,
        width: size,
        alignment: Alignment.center,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
  }
}

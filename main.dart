import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  String inputValue = "";
  String calculatedvalue = "";
  String operator = "";

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width / 7;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            // Display area
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                widget.inputValue,
                style: const TextStyle(
                  color: Color.fromARGB(228, 255, 255, 255),
                  fontSize: 100,
                ),
              ),
            ),
            // Calculator buttons
            Column(
              children: [
                Row(
                  children: [
                    calcButton(size, "7", bgColor: Colors.white38),
                    calcButton(size, "8", bgColor: Colors.white38),
                    calcButton(size, "9", bgColor: Colors.white38),
                    calcButton(size, "/", bgColor: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcButton(size, "4", bgColor: Colors.white38),
                    calcButton(size, "5", bgColor: Colors.white38),
                    calcButton(size, "6", bgColor: Colors.white38),
                    calcButton(size, "*", bgColor: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcButton(size, "1", bgColor: Colors.white38),
                    calcButton(size, "2", bgColor: Colors.white38),
                    calcButton(size, "3", bgColor: Colors.white38),
                    calcButton(size, "-", bgColor: Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calcButton(size, "0", bgColor: Colors.white38),
                    calcButton(size, ".", bgColor: Colors.white38),
                    calcButton(size, "=", bgColor: Colors.orange),
                    calcButton(size, "+", bgColor: Colors.orange),
                  ],
                ),
              ],
            ),
            calcButton(size, "Clear", bgColor: Colors.black),
          ],
        ),
      ),
    );
  }

  Widget calcButton(
    double size,
    String text, {
    Color bgColor = Colors.white54,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          if (text == "Clear") {
            widget.inputValue = "";
            widget.calculatedvalue = "";
            widget.operator = "";
          } else if (text == "+" || text == "-" || text == "*" || text == "/") {
            widget.calculatedvalue = widget.inputValue;
            widget.operator = text;
            widget.inputValue = "";
          } else if (text == "=") {
            double num1 = double.tryParse(widget.calculatedvalue) ?? 0;
            double num2 = double.tryParse(widget.inputValue) ?? 0;
            double result = 0;

            switch (widget.operator) {
              case "+":
                result = num1 + num2;
                break;
              case "-":
                result = num1 - num2;
                break;
              case "*":
                result = num1 * num2;
                break;
              case "/":
                result = num2 != 0 ? num1 / num2 : 0;
                break;
            }

            widget.inputValue = result.toString();
          } else {
            widget.inputValue += text;
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(100),
        ),
        margin: const EdgeInsets.all(10),
        height: size,
        width: size,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}

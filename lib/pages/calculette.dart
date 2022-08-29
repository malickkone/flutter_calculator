// ignore_for_file: prefer_const_declarations

import 'package:calculatrice/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculette extends StatefulWidget {
  const Calculette({super.key});

  @override
  State<Calculette> createState() => _CalculetteState();
}

class _CalculetteState extends State<Calculette> {
  var userQuestion = '';
  var userAnswer = '';
  final textstyle = TextStyle(
      fontSize: 18, color: Colors.deepPurple[900], fontWeight: FontWeight.bold);
  List<String> button = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'X',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 30),
                Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.topLeft,
                    child: Text(
                      userQuestion,
                      style: textstyle,
                    )),
                Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.topRight,
                    child: Text(
                      userAnswer,
                      style: textstyle,
                    ))
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: GridView.builder(
                  itemCount: button.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Button(
                          Colors.green, Colors.deepPurple[50], button[index],
                          () {
                        setState(() {
                          userQuestion = '';
                          userAnswer = '';
                        });
                      });
                    } else if (index == 1) {
                      return Button(
                          Colors.red, Colors.deepPurple[50], button[index], () {
                        setState(() {
                          userQuestion = userQuestion.substring(
                              0, userQuestion.length - 1);
                        });
                      });
                    } else if (index == button.length - 1) {
                      return Button(
                          isTrue(button[index])
                              ? Colors.deepPurple
                              : Colors.white,
                          isTrue(button[index])
                              ? Colors.deepPurple[50]
                              : Colors.deepPurple,
                          button[index], () {
                        setState(() {
                          isOperator();
                        });
                      });
                    } else {
                      return Button(
                          isTrue(button[index])
                              ? Colors.deepPurple
                              : Colors.white,
                          isTrue(button[index])
                              ? Colors.deepPurple[50]
                              : Colors.deepPurple,
                          button[index], () {
                        setState(() {
                          userQuestion += button[index];
                        });
                      });
                    }
                  }))
        ],
      ),
    );
  }

  bool isTrue(String x) {
    if (x == '%' || x == '/' || x == 'X' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void isOperator() {
    var finalQuestion = userQuestion.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAnswer = eval.toString();
  }
}

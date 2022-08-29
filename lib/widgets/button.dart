// ignore_for_file: prefer_typing_uninitialized_variables, use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';


class Button extends StatelessWidget {

  final color;
  final texColor;
  final String textButton;
  final  buttonTap ;
  const Button(this.color,this.texColor,this.textButton, this.buttonTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                textButton,
                style: TextStyle(color: texColor, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// ignore_for_file: file_names

import 'package:flutter/material.dart';

Widget buildButton(String buttonText){
  return Expanded(
    child: OutlinedButton(
      child: Text(
        buttonText,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
      ),
      onPressed: (){}));
}

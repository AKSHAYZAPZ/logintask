import 'package:flutter/material.dart';

InputDecoration formDecoration(String labelText) {
  return InputDecoration(
    border: const OutlineInputBorder(),
    errorStyle: const TextStyle(fontSize: 13),
    
    errorMaxLines: 3,
    labelText: labelText,
    labelStyle: const TextStyle(color: Colors.white60),
    enabledBorder: enabledBorder,
    focusedBorder: focusedBorder,
    errorBorder: errorBorder,
  );
}

const enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    borderSide: BorderSide(width: 2, color: Colors.white60));
const focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(width: 2, color: Colors.white60));
const errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(width: 2, color: Colors.red));

BoxDecoration boxDecoration() {
  return const BoxDecoration(
      image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover));
}
import 'package:flutter/material.dart';

class textField extends StatelessWidget {
  const textField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
  required this.keyboardType,

  });
 final keyboardType;
  final controller;
  final String hintText;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(

          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          suffixIcon: Icon(
            icon,
            color: Colors.blue,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}

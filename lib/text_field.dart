import 'package:flutter/material.dart';

class textField extends StatelessWidget {
   textField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.icon,
  required this.keyboardType,
  required this.message,
   required this.controllerTypeValue

   });
 final keyboardType;
  final controller;
  final String hintText;
  final icon;
  String message;
  var controllerTypeValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: (value){
          if(value==null||value.isEmpty){
            return message;
          }
        },
        onChanged: (value){
          controllerTypeValue=value;

        },
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
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.white)) ,
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

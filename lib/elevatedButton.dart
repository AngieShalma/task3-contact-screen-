import 'package:flutter/material.dart';
typedef onPress= void Function();
class elevatedButton extends StatelessWidget {
  String label;
  Color color;
   onPress onPressed;
  elevatedButton({
  super.key,
  required this.label,
  required this.color,
  required this.onPressed

  });

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed:onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize:Size(170, 45),
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(25),

        ),
      ),

      child: Text(label,style: TextStyle(color: Colors.black,fontSize: 16),),
    );
  }
}
import 'package:flutter/material.dart';

class elevatedButton extends StatelessWidget {
  String label;
  Color color;
  Function onPress;
  elevatedButton({
  super.key,
  required this.label,
  required this.color,
  required this.onPress

  });

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: (){
        onPress;},
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
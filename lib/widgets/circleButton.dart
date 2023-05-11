import 'package:flutter/material.dart';

//Circle Button, when pressed = create a new attendance
class CircleButton extends StatelessWidget {
  const CircleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.0,
      height: 75.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.yellow[300], // Button background color
      ),
      child: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed('/create_class');
          },
          child:  Image.asset(
            'assets/logo.png',
            width: 75.0 * 0.5, // Adjust image size as needed
            height: 75.0 * 0.5,
          ),
        ),


      ),
    );
  }
}

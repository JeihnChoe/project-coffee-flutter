import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final move;
  const CustomButton(this.title,this.move,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: kAccentColor,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => move),);
          },
          child: Text(
            "${title}",
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

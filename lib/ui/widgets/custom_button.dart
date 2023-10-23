import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';

class CustomButton extends StatelessWidget {
  final String title;
  const CustomButton(this.title,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          color: Colors.black26,
        ),
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
          onPressed: () {},
          child: Text(
            "${title}",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

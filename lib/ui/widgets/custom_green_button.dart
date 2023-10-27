import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/style.dart';

import '../pages/home_page/home_main_page/home_main_page.dart';
import '../pages/main_page/main_page.dart';
import 'custom_white_pop_button.dart';

class CustomGreenButton extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final move;
  const CustomGreenButton(this.title, this.width, this.height, this.move,
      {super.key});

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
            minimumSize: Size(width, height),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: () {
            if (title != "박서영") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => move),
              );
            }


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

import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';

class CustomWhiteButton extends StatelessWidget {
  final String title;
  final move;
  const CustomWhiteButton(this.title, this.move, {super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => move),
        );
      },
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: BorderSide(
            color: kAccentColor,
          )),
      child: Text(
        "${title}",
        style: TextStyle(color: kAccentColor),
      ),
    );
  }
}

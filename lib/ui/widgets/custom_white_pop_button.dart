import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';

class CustomWhitePopButton extends StatelessWidget {
  final String text;
  const CustomWhitePopButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          side: BorderSide(
            color: kAccentColor,
          )),
      child: Text(
        "${text}",
        style: TextStyle(color: kAccentColor),
      ),
    );
  }
}

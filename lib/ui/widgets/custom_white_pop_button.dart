import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';

class CustomWhitePopButton extends StatelessWidget {
  const CustomWhitePopButton({super.key});

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
        "취소",
        style: TextStyle(color: kAccentColor),
      ),
    );
  }
}

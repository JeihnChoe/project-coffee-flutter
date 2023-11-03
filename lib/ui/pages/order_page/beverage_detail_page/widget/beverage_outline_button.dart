import 'package:flutter/material.dart';

class BeverageOutlineButton extends StatelessWidget {
  String text;
  Color mColor;
  BeverageOutlineButton(
      this.text,
      this.mColor, {
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Text(
        "${text}",
        style: TextStyle(color: mColor),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

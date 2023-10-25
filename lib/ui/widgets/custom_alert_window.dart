import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';

class CustomAlertWindow extends StatelessWidget {
  final String content;
  final String buttonName1;
  final String buttonName2;
  final String clickButton;
  final move1;
  final move2;

  const CustomAlertWindow(
      {required this.content,
      required this.buttonName1,
      required this.buttonName2,
      required this.clickButton,
      this.move1,
      this.move2,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          content: Text("${content}"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: kAccentColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => move1)); //이동할 페이지1
              },
              child: Text("${buttonName1}"), //버튼이름1
            ),
            TextButton(
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  side: BorderSide(
                    color: kAccentColor,
                  )),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => move2)); //이동할 페이지2
              },
              child: Text("${buttonName2}"), //버튼이름2
            ),
          ],
        ),
      ),
      child: Text("${clickButton}"),
    );
  }
}

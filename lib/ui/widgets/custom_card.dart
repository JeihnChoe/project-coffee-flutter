import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';

class CustomCard extends StatelessWidget {
  final String content;
  final double width;
  final double height;
  final String buttonname1;
  final String buttonname2;
  final move1;
  final move2;

  const CustomCard(
      {required this.content,
      required this.width,
      required this.height,
      required this.buttonname1,
      required this.buttonname2,
      this.move1,
      this.move2,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: textBody1("${content}"),
            ),
            SizedBox(height: gap_m),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => move1));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: kAccentColor,
                    ),
                    child: Text("$buttonname1"),
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => move2));
                  },
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: BorderSide(
                        color: kAccentColor,
                      )),
                  child: Text(
                    "$buttonname2",
                    style: TextStyle(color: kAccentColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/ui/pages/home_page/home_login_change_main_page/home_login_change_main_page.dart';

import '../../_core/constants/color.dart';

class SubmitBottomButton extends StatelessWidget {
  const SubmitBottomButton({
    super.key,
    required this.text,
    required this.formField,
  });
  final String text;
  final formField;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return TextButton(
          style: TextButton.styleFrom(
            backgroundColor: kAccentColor,
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          onPressed: () {
            formField.submit(ref);
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => HomeLoginChangeMainPage()));
          },
          child: Text(
            "${text}",
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }
}

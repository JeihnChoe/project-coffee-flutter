import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/ui/pages/home_page/join_page/widget/join_page_body.dart';
import 'package:project_coffee/ui/pages/home_page/join_page/widget/join_page_form_field.dart';


class JoinPage extends StatelessWidget {
  JoinPage({super.key});
  JoinPageFormField formFeild = JoinPageFormField();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: JoinPageBody(formFeild),
      persistentFooterButtons: [
        Consumer(
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
                formFeild.submit(ref);
              },
              child: Text(
                "회원가입",
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

Text textTitle0(String text) {
  return Text(
    "$text",
    style: TextStyle(
        color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
  );
}

Text textTitle1(String text) {
  return Text(
    "$text",
    style: TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
  );
}

Text textTitle2(String text) {
  return Text(
    "$text",
    style: TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
  );
}

Text textBody1(String text) {
  return Text(
    "$text",
    style: TextStyle(color: Colors.black, fontSize: 13),
  );
}

Text textBody3(String text) {
  return Text("$text", style: TextStyle(color: Colors.black, fontSize: 11));
}

Text textBody2(String text, {int maxLine = 2}) {
  return Text(
    "$text",
    style: TextStyle(color: Colors.black, fontSize: 10),
    maxLines: maxLine,
  );
}

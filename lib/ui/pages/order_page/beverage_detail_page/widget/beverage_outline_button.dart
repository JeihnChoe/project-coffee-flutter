import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/order_request.dart';

class BeverageOutlineButton extends StatefulWidget {
  String text;
  Color mColor;
  bool isIced;
  BeverageOutlineButton(
      this.text,
      this.mColor, this.isIced,{
        super.key,
      });

  bool icedCheck(bool isIced){
    // true : ice , false hot
    if(isIced==true){
      return true;
    }else{
      return false;
    }
  }
  @override
  State<BeverageOutlineButton> createState() => _BeverageOutlineButtonState();
}

class _BeverageOutlineButtonState extends State<BeverageOutlineButton> {
  int ice = 0;

  @override
  Widget build(BuildContext context) {

    return OutlinedButton(
      onPressed: () {
        setState(() {
          if(widget.isIced == true){
            Logger().d("이거나오나");
            ice = 0;
          }  else{
            Logger().d("이거나오나");
            ice = 1;
          }
        });
      },
      child: Text(
        "${widget.text}",
        style: TextStyle(color: widget.mColor),
      ),
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

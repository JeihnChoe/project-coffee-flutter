import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/order_request.dart';

class BeverageOutlineButton extends StatefulWidget {
  String text;
  Color mColor;
  BeverageOrderReqDTO beverageOrderReqDTO;
  bool isIced;
  BeverageOutlineButton(
      this.text,
      this.mColor, this.beverageOrderReqDTO,this.isIced,{
        super.key,
      });


  @override
  State<BeverageOutlineButton> createState() => _BeverageOutlineButtonState();
}

class _BeverageOutlineButtonState extends State<BeverageOutlineButton> {

  @override
  Widget build(BuildContext context) {

    return OutlinedButton(
      onPressed: () {
        setState(() {
          if(widget.isIced == true){
            widget.beverageOrderReqDTO.isIced = 0;
            Logger().d("이거 값 보여줭${widget.beverageOrderReqDTO.isIced}");
          }  else{

            widget.beverageOrderReqDTO.isIced = 1;
            Logger().d("이거 값 보여줭${widget.beverageOrderReqDTO.isIced}");
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

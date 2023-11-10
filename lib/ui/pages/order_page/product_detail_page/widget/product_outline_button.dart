import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/model/product.dart';

class ProductOutlineButton extends StatefulWidget {
  String text;
  Color mColor;
  ProductOrderReqDTO productOrderReqDTO;
  bool isIced;
  ProductOutlineButton(
      this.text,
      this.mColor, this.productOrderReqDTO,this.isIced,{
        super.key,
      });


  @override
  State<ProductOutlineButton> createState() => _ProductOutlineButtonState();
}

class _ProductOutlineButtonState extends State<ProductOutlineButton> {

  @override
  Widget build(BuildContext context) {

    return OutlinedButton(
      onPressed: () {
        setState(() {
          if(widget.isIced == false){
            widget.productOrderReqDTO.isIced = 0;
            Logger().d("이거 값 보여줭${widget.productOrderReqDTO.isIced}");
          }  else{
            widget.productOrderReqDTO.isIced = 1;
            Logger().d("이거 값 보여줭${widget.productOrderReqDTO.isIced}");
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

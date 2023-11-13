import 'package:flutter/material.dart';
import 'package:project_coffee/data/dto/order_request.dart';

class BottomSheetOutlineButtonThird extends StatefulWidget {
  final ProductOrderReqDTO productOrderReqDTO;

  BottomSheetOutlineButtonThird({required this.productOrderReqDTO});

  @override
  State<BottomSheetOutlineButtonThird> createState() =>
      _BottomSheetOutlineButtonState();
}

class _BottomSheetOutlineButtonState
    extends State<BottomSheetOutlineButtonThird> {
  @override
  void initState() {
    widget.productOrderReqDTO.sizeId = 5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row();
  }
}

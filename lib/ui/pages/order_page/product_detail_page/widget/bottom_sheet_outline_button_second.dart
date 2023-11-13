import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/data/dto/order_request.dart';

class BottomSheetOutlineButtonSecond extends StatefulWidget {
  ProductDetailResDTO productDetailResDTO;
  final ProductOrderReqDTO productOrderReqDTO;
  int selectedTabMethod;
  int count;
  final ValueChanged<int> onStateChange;

  BottomSheetOutlineButtonSecond(
      {required this.productDetailResDTO,
      required this.productOrderReqDTO,
      required this.selectedTabMethod,
      required this.count,
      required this.onStateChange});

  int submit(int selectedPayment) {
    int selectedPaymentMethod = selectedPayment;
    return selectedPaymentMethod;
  }

  @override
  State<BottomSheetOutlineButtonSecond> createState() =>
      _BottomSheetOutlineButtonState();
}

class _BottomSheetOutlineButtonState
    extends State<BottomSheetOutlineButtonSecond> {
  int selectedPayment = 6;
  int sixPrice = 0;
  int sevenPrice = 1;

  @override
  void initState() {
    selectedPayment = selectedPayment;
    widget.productOrderReqDTO.sizeId = selectedPayment;
    sixPrice = widget.productDetailResDTO.optionPrice;
    sevenPrice = widget.productDetailResDTO.optionPrice + 500;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          onPressed: () {
            setState(() {
              selectedPayment = 6;
              widget.productOrderReqDTO.sizeId = selectedPayment;
              widget.productOrderReqDTO.sizePrice = sixPrice;
              widget.productOrderReqDTO.totalPrice = sixPrice * widget.count;
              widget.onStateChange(selectedPayment);
              Logger().d("이거 안보여줘 ???${widget.productOrderReqDTO.totalPrice}");
            });
          },
          style: OutlinedButton.styleFrom(
            primary: selectedPayment == 6 ? kAccentColor : Colors.black,
            side: BorderSide(
              color: selectedPayment == 6 ? kAccentColor : Colors.grey,
              width: 1.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 16),
                  SizedBox(height: gap_m),
                  Text("short"),
                  SizedBox(height: gap_s),
                  Text("237ml"),
                  SizedBox(height: gap_l),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        OutlinedButton(
          onPressed: () {
            setState(() {
              selectedPayment = 7;
              widget.productOrderReqDTO.sizeId = selectedPayment;
              widget.productOrderReqDTO.sizePrice = sevenPrice;
              widget.productOrderReqDTO.totalPrice = sevenPrice * widget.count;
              widget.onStateChange(selectedPayment);
              Logger().d("이거 안보여줘 ???${widget.productOrderReqDTO.totalPrice}");
            });
          },
          style: OutlinedButton.styleFrom(
            primary: selectedPayment == 7 ? kAccentColor : Colors.black,
            side: BorderSide(
              color: selectedPayment == 7 ? kAccentColor : Colors.grey,
              width: 1.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 16),
                  SizedBox(height: gap_m),
                  Text("Tall"),
                  SizedBox(height: gap_s),
                  Text("355ml"),
                  SizedBox(height: gap_l),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

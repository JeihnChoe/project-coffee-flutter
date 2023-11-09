import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/data/dto/order_request.dart';

class BottomSheetOutlineButtonTwo extends StatefulWidget {
  final BeverageOrderReqDTO beverageOrderReqDTO;
  int selectedTabMethod;
  int count;
  final ValueChanged<int> onStateChange;

  BottomSheetOutlineButtonTwo(
      {required this.beverageOrderReqDTO, required this.selectedTabMethod, required this.count, required this.onStateChange});

  int submit(int selectedPayment) {
    int selectedPaymentMethod = selectedPayment;
    return selectedPaymentMethod;
  }

  @override
  State<BottomSheetOutlineButtonTwo> createState() =>
      _BottomSheetOutlineButtonState();
}

class _BottomSheetOutlineButtonState
    extends State<BottomSheetOutlineButtonTwo> {
  int selectedPayment = 6;
  int zeroprice = 6;
  int oneprice = 7;

  @override
  void initState() {
    selectedPayment = selectedPayment;
    zeroprice = widget.beverageOrderReqDTO.beverage.price;
    oneprice = widget.beverageOrderReqDTO.beverage.price + 500;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  selectedPayment = 0;
                  widget.beverageOrderReqDTO.sizePrice = zeroprice;
                  widget.beverageOrderReqDTO.totalmoney =
                      zeroprice * widget.count;
                  widget.beverageOrderReqDTO.cup = 0;
                  widget.onStateChange(selectedPayment);
                  Logger().d(widget.beverageOrderReqDTO.cup);
                  Logger().d(
                      "이거 안보여줘 ???${widget.beverageOrderReqDTO.totalmoney}");
                });
              },
              style: OutlinedButton.styleFrom(
                primary: selectedPayment == 0 ? kAccentColor : Colors.black,
                side: BorderSide(
                  color: selectedPayment == 0 ? kAccentColor : Colors.grey,
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
                      Container(
                        width: 40,
                        child: Image.asset(
                          "assets/tall.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: gap_m),
                      Text("short"),
                      SizedBox(height: gap_s),
                      Text("237ml"),
                      SizedBox(height: gap_l),
                    ],
                  ),
                  if (selectedPayment == 0)
                    Positioned(
                      top: 25, // 위로 올릴 값
                      left: 10,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                selectedPayment = 1;
                widget.beverageOrderReqDTO.sizePrice = oneprice;
                widget.beverageOrderReqDTO.totalmoney = oneprice * widget.count;

                widget.beverageOrderReqDTO.cup = 1;
                widget.onStateChange(selectedPayment);
                Logger().d(widget.beverageOrderReqDTO.cup);
                Logger().d(
                    "이거 안보여줘 ???${widget.beverageOrderReqDTO.totalmoney}");
              });
            },
            style: OutlinedButton.styleFrom(
              primary: selectedPayment == 1 ? kAccentColor : Colors.black,
              side: BorderSide(
                color: selectedPayment == 1 ? kAccentColor : Colors.grey,
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
                    Container(
                      width: 40,
                      child: Image.asset(
                        "assets/tall.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: gap_m),
                    Text("Tall"),
                    SizedBox(height: gap_s),
                    Text("355ml"),
                    SizedBox(height: gap_l),
                  ],
                ),
                if (selectedPayment == 1)
                  Positioned(
                    top: 25, // 위로 올릴 값
                    left: 10,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}

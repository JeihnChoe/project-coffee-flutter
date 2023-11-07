import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/data/dto/order_request.dart';

class BottomSheetOutlineButton extends StatefulWidget {
  final BeverageOrderReqDTO beverageOrderReqDTO;
  int selectedTabMethod;
  final ValueChanged<int> onStateChange;

  BottomSheetOutlineButton(
      {required this.beverageOrderReqDTO,required this.selectedTabMethod,required this.onStateChange});

  int submit(int selectedPayment) {
    int selectedPaymentMethod = selectedPayment;
    return selectedPaymentMethod;
  }

  @override
  State<BottomSheetOutlineButton> createState() =>
      _BottomSheetOutlineButtonState();
}

class _BottomSheetOutlineButtonState extends State<BottomSheetOutlineButton> {
  int selectedPayment = 1;
  int zeroprice= 0;
  int oneprice= 1;
  int twoprice= 2;
  int threeprice= 3;

  @override
  void initState() {
    selectedPayment = selectedPayment;
    zeroprice = widget.beverageOrderReqDTO.beverage.price-500;
    oneprice= widget.beverageOrderReqDTO.beverage.price;
    twoprice= widget.beverageOrderReqDTO.beverage.price+500;
    threeprice= widget.beverageOrderReqDTO.beverage.price+1000;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.beverageOrderReqDTO.isIced == 0)
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                setState(() {

                  selectedPayment = 0;
                  widget.onStateChange(selectedPayment);
                  widget.beverageOrderReqDTO.totalmoney = zeroprice;
                  widget.beverageOrderReqDTO.cup = 0;
                  Logger().d(widget.beverageOrderReqDTO.cup);
                  Logger().d("이거 안보여줘 ???${widget.beverageOrderReqDTO.totalmoney}");
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
                widget.onStateChange(selectedPayment);
                widget.beverageOrderReqDTO.totalmoney = oneprice;
                widget.beverageOrderReqDTO.cup = 1;
                Logger().d(widget.beverageOrderReqDTO.cup);
                Logger().d("이거 안보여줘 ???${widget.beverageOrderReqDTO.totalmoney}");
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
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                selectedPayment = 2;

                widget.beverageOrderReqDTO.totalmoney = twoprice;
                widget.onStateChange(selectedPayment);
                widget.beverageOrderReqDTO.cup = 2;
                Logger().d(widget.beverageOrderReqDTO.cup);
                Logger().d("이거 안보여줘 ???${widget.beverageOrderReqDTO.totalmoney}");
              });
            },
            style: OutlinedButton.styleFrom(
              primary: selectedPayment == 2 ? kAccentColor : Colors.black,
              side: BorderSide(
                color: selectedPayment == 2 ? kAccentColor : Colors.grey,
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
                        "assets/grande.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: gap_m),
                    Text("Grande"),
                    SizedBox(height: gap_s),
                    Text("473ml"),
                    SizedBox(height: gap_l),
                  ],
                ),
                if (selectedPayment == 2)
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
                selectedPayment = 3;

                widget.beverageOrderReqDTO.totalmoney = threeprice;
                widget.onStateChange(selectedPayment);
                widget.beverageOrderReqDTO.cup = 3;
                Logger().d(widget.beverageOrderReqDTO.cup);
                Logger().d("이거 안보여줘 ???${widget.beverageOrderReqDTO.totalmoney}");
              });
            },
            style: OutlinedButton.styleFrom(
              primary: selectedPayment == 3 ? kAccentColor : Colors.black,
              side: BorderSide(
                color: selectedPayment == 3 ? kAccentColor : Colors.grey,
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
                        "assets/venti.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: gap_m),
                    Text("Venti"),
                    SizedBox(height: gap_s),
                    Text("591ml"),
                    SizedBox(height: gap_l),
                  ],
                ),
                if (selectedPayment == 3)
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
        )
      ],
    );
  }
}

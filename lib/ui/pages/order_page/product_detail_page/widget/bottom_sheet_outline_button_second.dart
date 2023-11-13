import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/data/dto/order_request.dart';

class BottomSheetOutlineButtonSecond extends StatefulWidget {
  final ProductOrderReqDTO productOrderReqDTO;
  int selectedTabMethod;
  int count;
  final ValueChanged<int> onStateChange;

  BottomSheetOutlineButtonSecond(
      {required this.productOrderReqDTO,required this.selectedTabMethod,required this.count,required this.onStateChange});

  int submit(int selectedPayment) {
    int selectedPaymentMethod = selectedPayment;
    return selectedPaymentMethod;
  }

  @override
  State<BottomSheetOutlineButtonSecond> createState() =>
      _BottomSheetOutlineButtonState();
}

class _BottomSheetOutlineButtonState extends State<BottomSheetOutlineButtonSecond> {
  int selectedPayment = 2;
  // int zeroprice= 0;
  // int oneprice= 1;
  // int twoprice= 2;
  // int threeprice= 3;

  @override
  void initState() {
    selectedPayment = selectedPayment;
    // zeroprice = widget.productOrderReqDTO.product.price-500;
    // oneprice= widget.productOrderReqDTO.product.price;
    // twoprice= widget.productOrderReqDTO.product.price+500;
    // threeprice= widget.productOrderReqDTO.product.price+1000;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.productOrderReqDTO.isIced == 0)
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  selectedPayment = 1;
                  // widget.productDetailResDTO.option.price = zeroprice;
                  // widget.productOrderReqDTO.totalmoney = zeroprice * widget.count;
                  // widget.productOrderReqDTO.cup = 0;
                  // widget.onStateChange(selectedPayment);
                  // Logger().d(widget.productOrderReqDTO.cup);
                  // Logger().d("이거 안보여줘 ???${widget.productOrderReqDTO.totalmoney}");
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
                      Text("short"),
                      SizedBox(height: gap_s),
                      Text("237ml"),
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
                // widget.productOrderReqDTO.sizePrice = oneprice;
                // widget.productOrderReqDTO.totalmoney = oneprice* widget.count;
                //
                // widget.productOrderReqDTO.cup = 1;
                // widget.onStateChange(selectedPayment);
                // Logger().d(widget.productOrderReqDTO.cup);
                // Logger().d("이거 안보여줘 ???${widget.productOrderReqDTO.totalmoney}");
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
                // widget.productOrderReqDTO.sizePrice = twoprice;
                // widget.productOrderReqDTO.totalmoney = twoprice* widget.count;
                // widget.productOrderReqDTO.cup = 2;
                // widget.onStateChange(selectedPayment);
                // Logger().d(widget.productOrderReqDTO.cup);
                // Logger().d("이거 안보여줘 ???${widget.productOrderReqDTO.totalmoney}");
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
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                selectedPayment = 4;
                // widget.productOrderReqDTO.sizePrice = threeprice;
                // widget.productOrderReqDTO.totalmoney = threeprice* widget.count;
                // widget.productOrderReqDTO.cup = 3;
                // widget.onStateChange(selectedPayment);
                // Logger().d(widget.productOrderReqDTO.cup);
                // Logger().d("이거 안보여줘 ???${widget.productOrderReqDTO.totalmoney}");
              });
            },
            style: OutlinedButton.styleFrom(
              primary: selectedPayment == 4 ? kAccentColor : Colors.black,
              side: BorderSide(
                color: selectedPayment == 4 ? kAccentColor : Colors.grey,
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
                if (selectedPayment == 4)
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

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';

class BottomSheetOutlineButton extends StatefulWidget {
  final int hotice;
  final int selectedPaymentMethod;
  BottomSheetOutlineButton({required this.selectedPaymentMethod,required this.hotice});

  int submit(int selectedPayment){
    int selectedPaymentMethod = selectedPayment;
    return selectedPaymentMethod;
  }

  @override
  State<BottomSheetOutlineButton> createState() => _BottomSheetOutlineButtonState();
}

class _BottomSheetOutlineButtonState extends State<BottomSheetOutlineButton> {
  int selectedPayment = 0;
  @override
  void initState() {
    selectedPayment = widget.selectedPaymentMethod;
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

              });
            },
            style: OutlinedButton.styleFrom(
              primary: selectedPayment == 0 ? kAccentColor : Colors
                  .black,
              side: BorderSide(
                color: selectedPayment == 0 ? kAccentColor : Colors
                    .grey,
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

              });
            },
            style: OutlinedButton.styleFrom(
              primary: selectedPayment == 1 ? kAccentColor : Colors
                  .black,
              side: BorderSide(
                color: selectedPayment == 1 ? kAccentColor : Colors
                    .grey,
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

              });
            },
            style: OutlinedButton.styleFrom(
              primary: selectedPayment == 2 ? kAccentColor : Colors
                  .black,
              side: BorderSide(
                color: selectedPayment == 2 ? kAccentColor : Colors
                    .grey,
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

              });
            },
            style: OutlinedButton.styleFrom(
              primary: selectedPayment == 3 ? kAccentColor : Colors
                  .black,
              side: BorderSide(
                color: selectedPayment == 3 ? kAccentColor : Colors
                    .grey,
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
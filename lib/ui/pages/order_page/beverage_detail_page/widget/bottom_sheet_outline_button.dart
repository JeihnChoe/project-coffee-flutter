import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';

class BottomSheetOutlineButton extends StatefulWidget {

  @override
  State<BottomSheetOutlineButton> createState() => _BottomSheetOutlineButtonState();
}

class _BottomSheetOutlineButtonState extends State<BottomSheetOutlineButton> {
  int selectedPaymentMethod = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              setState(() {
                selectedPaymentMethod = 1;
                Logger().d(selectedPaymentMethod);
              });
            },
            style: OutlinedButton.styleFrom(
              primary: selectedPaymentMethod == 1 ? kAccentColor : Colors
                  .black,
              side: BorderSide(
                color: selectedPaymentMethod == 1 ? kAccentColor : Colors
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
                if (selectedPaymentMethod == 1)
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
                selectedPaymentMethod = 2;
                Logger().d(selectedPaymentMethod);
              });
            },
            style: OutlinedButton.styleFrom(
              primary: selectedPaymentMethod == 2 ? kAccentColor : Colors
                  .black,
              side: BorderSide(
                color: selectedPaymentMethod == 2 ? kAccentColor : Colors
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
                if (selectedPaymentMethod == 2)
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
                selectedPaymentMethod = 3;
                Logger().d(selectedPaymentMethod);
              });
            },
            style: OutlinedButton.styleFrom(
              primary: selectedPaymentMethod == 3 ? kAccentColor : Colors
                  .black,
              side: BorderSide(
                color: selectedPaymentMethod == 3 ? kAccentColor : Colors
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
                if (selectedPaymentMethod == 3)
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
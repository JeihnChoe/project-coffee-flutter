import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/beverage.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';
import 'package:project_coffee/ui/pages/order_page/beverage_detail_page/widget/bottom_sheet_sliver_appbar.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';
import 'package:project_coffee/ui/widgets/custom_white_button.dart';
import 'package:project_coffee/ui/widgets/flexible_bottom_sheet_route.dart';

import 'widget/beverage_detail_page_body.dart';
import 'widget/bottom_sheet_outline_button.dart';

class BeverageDetailPage extends StatelessWidget {
  Beverage beverage;

  BeverageDetailPage(this.beverage);

  void _openBottomSheetWithInfo(BuildContext context, Beverage beverage) {
    showFlexibleBottomSheet<void>(
      isExpand: false,
      initHeight: 1,
      maxHeight: 1,
      context: context,
      builder: (context, controller, offset) {
        return _BottomSheet(
          beverage: beverage,
          controller: controller,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BeverageDetailPageBody(beverage),
      persistentFooterButtons: [
        TextButton(
            style: TextButton.styleFrom(
              backgroundColor: kAccentColor,
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: () => _openBottomSheetWithInfo(context, beverage),
            child: Center(
              child: Text(
                "주문하기",
                style: TextStyle(color: Colors.white),
              ),
            ))
      ],
    );
  }
}

class _BottomSheet extends StatefulWidget {
  final Beverage beverage;
  final ScrollController controller;

  const _BottomSheet({
    required this.beverage,
    required this.controller,
  });

  @override
  State<_BottomSheet> createState() => _BottomSheetState();
}

class _BottomSheetState extends State<_BottomSheet> {
  int selectedPaymentMethod = 1; //컵 사이즈 초기화
  int selectedTabMethod = 1; //컵 선택 초기화
  int count = 1;  // 카운트 초기화
  int totalprice=0;

  @override
  void initState(){
    super.initState();
    totalprice = widget.beverage.price;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: () {
                      if(count!=1){
                        setState(() {
                          count--;
                          totalprice = totalprice - widget.beverage.price;
                        });
                      }
                    }, icon: Icon(CupertinoIcons.minus_circle),color: count == 1 ? Colors.grey : Colors.black,),
                    Text("$count"),
                    IconButton(onPressed: () {
                      setState(() {
                        count++;
                        totalprice = totalprice +widget.beverage.price;
                      });
                    }, icon: Icon(CupertinoIcons.plus_circle))

                  ],
                ),
                textTitle1("${totalprice}"),


              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {

                }, icon: Icon(CupertinoIcons.heart)),
                Row(
                  children: [
                    CustomWhiteButton("담기", MainPage),
                    SizedBox(width: gap_m,),
                    CustomGreenButton("주문하기", 120, 25, MainPage),
                    SizedBox(width: gap_m,)
                  ],
                ),
              ],
            ),
          ],
        )
      ],
      body: Container(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Container(color: Colors.white, child: SizedBox(height: 16)),
          ),
          BottomSheetSliverAppBar(
            beverage: widget.beverage,
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  controller: widget.controller,
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, top: 10, right: 10, bottom: 10),
                      width: double.infinity,
                      color: Color.fromRGBO(241, 250, 247, 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "환경을 위해 일회용컵 사용 줄이기에 동참해주세요.",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromRGBO(78, 155, 121, 1)),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    textTitle2("사이즈"),
                    SizedBox(
                      height: 16,
                    ),
                    BottomSheetOutlineButton(),
                    SizedBox(
                      height: gap_l,
                    ),
                    textTitle2("컵 선택"),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedTabMethod = 1;
                              });
                            },
                            child: Text(
                              "매장컵",
                              style: TextStyle(
                                  color: selectedTabMethod == 1
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: selectedTabMethod == 1
                                  ? kAccentColor
                                  : Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.circular(30))),
                              side: BorderSide(
                                  color: selectedTabMethod == 1 ? kAccentColor : Colors.black,
                                  width: 0.5
                              ),
                            ),

                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedTabMethod = 2;
                              });
                            },
                            child: Text(
                              "개인컵",
                              style: TextStyle(
                                  color: selectedTabMethod == 2
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: selectedTabMethod == 2
                                  ? kAccentColor
                                  : Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero
                              ),
                              side: BorderSide(
                                  color: selectedTabMethod == 2 ? kAccentColor : Colors.black,
                                  width: 0.5
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedTabMethod = 3;
                              });
                            },
                            child: Text(
                              "일회용컵",
                              style: TextStyle(
                                  color: selectedTabMethod == 3
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: selectedTabMethod == 3
                                  ? kAccentColor
                                  : Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomRight: Radius.circular(30))
                              ),
                              side: BorderSide(
                                  color: selectedTabMethod == 3 ? kAccentColor : Colors.black,
                                  width: 0.5
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: gap_m,
                    ),
                    if (selectedTabMethod == 2)
                      Container(
                        width: double.infinity,
                        height: 150,
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              orderText(
                                  "-주문 후, 개인컵(355ml 이상 텀블러 등)을 '음료 받는 곳'에 전달해 주세요."),
                              orderText(
                                  "-개인컵은 다회용기(텀블러, 머그 등)만 사용 가능하며 1회용기에는 음료 제공이 불가합니다."),
                              orderText("-개인컵을 선택한 경우 일회용 리드는 제공되지 않습니다."),
                              orderText(
                                  "-개인컵이 전달되지 않거나 전달된 개인컵이 주문한 음료를 담기 어려울 경우 (용량 미달, 좁은 투입구 등) 주문이 거절될 수 있습니다."),
                              orderText(
                                  "-차량에서 음료를 픽업하는 경우 개인컵 이용시에는 리드(뚜껑)을 파트너에게 함께 전달하여 주세요."),
                            ],
                          ),
                        ),
                      )
                    else if (selectedTabMethod == 3)
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              orderText("매장에서 드시는 경우 일회용컵 사용이 불가능합니다."),
                              orderText("개인컵 또는 매장컵을 선택해 주시기 바랍니다."),
                            ],
                          ),
                        ),
                      ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

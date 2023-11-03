import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/beverage.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';
import 'package:project_coffee/ui/pages/order_page/beverage_detail_page/widget/bottom_sheet_sliver_appbar.dart';
import 'package:project_coffee/ui/pages/order_page/beverage_detail_page/widget/bottom_sheet_tab_bar.dart';
import 'package:project_coffee/ui/widgets/custom_green_button.dart';
import 'package:project_coffee/ui/widgets/flexible_bottom_sheet_route.dart';

import 'widget/beverage_detail_page_body.dart';
import 'widget/beverage_outline_button.dart';

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
          beverage : beverage,
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
            onPressed: () => _openBottomSheetWithInfo(context,beverage), child:Center(
          child: Text("주문하기",style: TextStyle(color: Colors.white),),
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

  @override
  Widget build(BuildContext context) {
    int selectedPaymentMethod = 1;
    return DefaultTabController(
      length: 3,
      child: Container(
        child: CustomScrollView(
            slivers:[
              SliverToBoxAdapter(child: Container(color: Colors.white,child: SizedBox(height: 16)),),
              BottomSheetSliverAppBar(beverage:widget.beverage,),
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
                          padding: EdgeInsets.only(left: 20,top: 10,right: 10,bottom: 10),
                          width: double.infinity,
                          color: Color.fromRGBO(241, 250, 247, 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(child: Text("환경을 위해 일회용컵 사용 줄이기에 동참해주세요.",style: TextStyle(fontSize: 11,color: Color.fromRGBO(78, 155, 121, 1)),),)
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        textTitle2("사이즈"),
                        SizedBox(height: 16,),
                        Row(
                          children: [
                            Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedPaymentMethod = 1;
                                    });
                                  },
                                  style: OutlinedButton.styleFrom(
                                    primary: Colors.black, // 텍스트 및 아이콘 색상
                                    side: BorderSide(color: Colors.grey, width: 1.0), // 외곽선 색상 및 두께
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0), // 둥근 모서리 설정 (원하는 값으로 조절)
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 16), // 아이콘과 라벨 사이의 간격
                                      Container(width: 40 ,child: Image.asset("assets/tall.jpg",fit: BoxFit.cover,)), // 아이콘
                                      SizedBox(height: gap_m), // 아이콘과 라벨 사이의 간격
                                      Text("Tall"), // 라벨
                                      SizedBox(height: gap_s), // 아이콘과 라벨 사이의 간격
                                      Text("355ml"), // 라벨
                                      SizedBox(height: gap_l), // 아이콘과 라벨 사이의 간격
                                    ],
                                  ),
                                )

                            ),
                            SizedBox(width: 10,),
                            Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedPaymentMethod = 2;
                                    });
                                  },
                                  style: OutlinedButton.styleFrom(
                                    primary: Colors.black, // 텍스트 및 아이콘 색상
                                    side: BorderSide(color: Colors.grey, width: 1.0), // 외곽선 색상 및 두께
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0), // 둥근 모서리 설정 (원하는 값으로 조절)
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 16), // 아이콘과 라벨 사이의 간격
                                      Container(width: 40 ,child: Image.asset("assets/grande.jpg",fit: BoxFit.cover,)), // 아이콘
                                      SizedBox(height: gap_m), // 아이콘과 라벨 사이의 간격
                                      Text("Grande"), // 라벨
                                      SizedBox(height: gap_s), // 아이콘과 라벨 사이의 간격
                                      Text("473ml"), // 라벨
                                      SizedBox(height: gap_l), // 아이콘과 라벨 사이의 간격
                                    ],
                                  ),
                                )
                            ),
                            SizedBox(width: 10,),
                            Expanded(
                                child: OutlinedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedPaymentMethod = 3;
                                    });
                                  },
                                  style: OutlinedButton.styleFrom(
                                    primary: Colors.black, // 텍스트 및 아이콘 색상
                                    side: BorderSide(color: Colors.grey, width: 1.0), // 외곽선 색상 및 두께
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0), // 둥근 모서리 설정 (원하는 값으로 조절)
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 16), // 아이콘과 라벨 사이의 간격
                                      Container(width: 40 ,child: Image.asset("assets/venti.jpg",fit: BoxFit.cover,)), // 아이콘
                                      SizedBox(height: gap_m), // 아이콘과 라벨 사이의 간격
                                      Text("Venti"), // 라벨
                                      SizedBox(height: gap_s), // 아이콘과 라벨 사이의 간격
                                      Text("591ml"), // 라벨
                                      SizedBox(height: gap_l), // 아이콘과 라벨 사이의 간격
                                    ],
                                  ),
                                )
                            ),

                          ],
                        ),
                        SizedBox(height: gap_l,),
                        textTitle2("컵 선택"),
                        TabPage(),
                        Divider(),


                        const SizedBox(height: 600),
                      ],
                    ),
                  ),
                ),
              )
            ]
        ),
      ),
    );
  }
}
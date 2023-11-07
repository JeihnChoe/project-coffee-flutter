import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/model/beverage.dart';

import 'beverage_outline_button.dart';

class BeverageDetailPageBody extends StatelessWidget {
  BeverageOrderReqDTO beverageOrderReqDTO;
  BeverageDetailPageBody(this.beverageOrderReqDTO);

  @override
  Widget build(BuildContext context) {
    if(beverageOrderReqDTO.beverage.hotIce == 0){
      beverageOrderReqDTO.isIced = 0;
    }else if(beverageOrderReqDTO.beverage.hotIce == 1){
      beverageOrderReqDTO.isIced = 1;
    }

    // ProductDetailModel? model = ref.watch(productDetailProvider);
    // if (model == null) {
    //   return Center(child: CircularProgressIndicator());
    // } else {
    //   Product product = model.product;

    return CustomScrollView(
      slivers: [
        _appbar(beverageOrderReqDTO.beverage),
        _body(beverageOrderReqDTO),
      ],
    );
  }
}

SliverPadding _body(BeverageOrderReqDTO beverageOrderReqDTO) {
  return SliverPadding(
    padding: EdgeInsets.all(16.0), // 패딩 설정
    sliver: SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitle1("${beverageOrderReqDTO.beverage.beverageName}"),
          textBody2("${beverageOrderReqDTO.beverage.beverageEngName}"),
          SizedBox(height: 10),
          textBody1(
            "${beverageOrderReqDTO.beverage.beverageDescription}",
          ),
          SizedBox(height: 10),
          textTitle1("${beverageOrderReqDTO.beverage.price}원"),
          SizedBox(height: 10),
          if (beverageOrderReqDTO.beverage.hotIce==0)
            Row(
              children: [
                Expanded(
                    child:BeverageOutlineButton ("HOT", kActiveColor2,beverageOrderReqDTO,false)),

              ],
            )
          else if(beverageOrderReqDTO.beverage.hotIce == 1)
            Row(
              children: [
                Expanded(child: BeverageOutlineButton("ICED ONLY", kActiveColor1,beverageOrderReqDTO,true)),
              ],
            )
          else if(beverageOrderReqDTO.beverage.hotIce == 2)
              Row(
                children: [
                  Expanded(child: BeverageOutlineButton("HOT", kActiveColor2,beverageOrderReqDTO,false)),
                  Expanded(child: BeverageOutlineButton("ICE", kActiveColor1,beverageOrderReqDTO,true)),
                ],
              ),

          SizedBox(height: 10),
          if(beverageOrderReqDTO.beverage.hotIce != 3)
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            color: Colors.grey[100],
            child: textBody3("${beverageOrderReqDTO.beverage.beverageTip}"),
          ),
          // SizedBox(height: 1000),
        ],
      ),
    ),
  );
}

SliverAppBar _appbar(Beverage beverage) {
  return SliverAppBar(
    pinned: true,
    elevation: 0.0,
    actions: [Icon(CupertinoIcons.share), SizedBox(width: 16)],
    iconTheme: IconThemeData(
      color: Color(0XFF8F8F8F),
    ),
    expandedHeight: 300,
    flexibleSpace: LayoutBuilder(
      builder: (context, constraints) {
        final bool isCollapsed = constraints.maxHeight <= 80;
        // print("kToolbarHeight : $kToolbarHeight");
        // print("constraints.maxHeight : ${constraints.maxHeight}");

        return FlexibleSpaceBar(
          background: Container(
            width: 100,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  image: NetworkImage("${beverage.beveragePicUrl}"),
                  fit: BoxFit.cover),
            ),
          ),
          title: isCollapsed
              ? Text(
            '${beverage.beverageName}',
            style: TextStyle(color: Colors.black),
          )
              : null,
          centerTitle: true,
        );
      },
    ),
  );
}




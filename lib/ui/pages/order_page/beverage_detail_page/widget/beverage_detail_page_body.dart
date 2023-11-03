import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/beverage.dart';

import 'beverage_outline_button.dart';

class BeverageDetailPageBody extends StatelessWidget {
  Beverage beverage;
  BeverageDetailPageBody(this.beverage);

  @override
  Widget build(BuildContext context) {
    // ProductDetailModel? model = ref.watch(productDetailProvider);
    // if (model == null) {
    //   return Center(child: CircularProgressIndicator());
    // } else {
    //   Product product = model.product;
      return CustomScrollView(
        slivers: [
          _appbar(beverage),
          _body(beverage),
        ],
      );
    }
  }

  SliverPadding _body(Beverage beverage) {
    return SliverPadding(
      padding: EdgeInsets.all(16.0), // 패딩 설정
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textTitle1("${beverage.beverageName}"),
            textBody2("${beverage.beverageEngName}"),
            SizedBox(height: 10),
            textBody1(
              "${beverage.beverageDescription}",
            ),
            SizedBox(height: 10),
            textTitle1("${beverage.price}원"),
            SizedBox(height: 10),
            if (beverage.hotIce==0)
              Row(
                children: [
                  Expanded(
                      child:BeverageOutlineButton ("HOT", kActiveColor2)),
                ],
              )
            else if(beverage.hotIce == 1)
              Row(
                children: [
                  Expanded(child: BeverageOutlineButton("ICED ONLY", kActiveColor1)),
                ],
              )
            else
              Row(
                children: [
                  Expanded(child: BeverageOutlineButton("ICE", kActiveColor1)),
                  Expanded(child: BeverageOutlineButton("HOT", kActiveColor2)),
                ],
              ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              color: Colors.grey[100],
              child: textBody3("${beverage.beverageTip}"),
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




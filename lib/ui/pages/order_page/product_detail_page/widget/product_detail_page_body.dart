import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/model/product.dart';

import 'product_outline_button.dart';

class ProductDetailPageBody extends StatelessWidget {
  ProductDetailResDTO productDetailResDTO;
  ProductOrderReqDTO productOrderReqDTO;
  ProductDetailPageBody(this.productDetailResDTO,this.productOrderReqDTO);

  @override
  Widget build(BuildContext context) {
    if(productDetailResDTO.isIced == 0){
      productOrderReqDTO.isIced = 0;

    }else if(productDetailResDTO.isIced == 1){
      productOrderReqDTO.isIced = 1;

    }

    return CustomScrollView(
      slivers: [
        _appbar(productDetailResDTO),
        _body(productDetailResDTO,productOrderReqDTO),
      ],
    );
  }
}

SliverPadding _body(ProductDetailResDTO productDetailResDTO,ProductOrderReqDTO productOrderReqDTO) {
// SliverPadding _body(ProductDetailResDTO productDetailResDTO) {
  return SliverPadding(
    padding: EdgeInsets.all(16.0), // 패딩 설정
    sliver: SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitle1("${productDetailResDTO.productName}"),
          textBody2("${productDetailResDTO.productEngName}"),
          SizedBox(height: 10),
          textBody1(
            "${productDetailResDTO.discription}",
          ),
          SizedBox(height: 10),
          textTitle1("${productDetailResDTO.optionPrice}원"),
          SizedBox(height: 10),
          // private int isIced; // 0 : hot, 1 : iced, 2 : both
          if (productDetailResDTO.isIced==0)
            Row(
              children: [
                Expanded(
                    child:ProductOutlineButton ("HOT ONLY", kActiveColor2,productDetailResDTO,productOrderReqDTO,false)),
              ],
            )
          else if(productDetailResDTO.isIced == 1)
            Row(
              children: [
                Expanded(child: ProductOutlineButton("ICED ONLY", kActiveColor1,productDetailResDTO,productOrderReqDTO,true)),
              ],
            )
          else if(productDetailResDTO.isIced == 2)
              Row(
                children: [
                  Expanded(child: ProductOutlineButton("HOT", kActiveColor2,productDetailResDTO,productOrderReqDTO,false)),
                  Expanded(child: ProductOutlineButton("ICE", kActiveColor1,productDetailResDTO,productOrderReqDTO,true)),
                ],
              ),

          SizedBox(height: 10),
          if(productDetailResDTO.isIced == 0 ||productDetailResDTO.isIced == 1||productDetailResDTO.isIced == 2)
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            color: Colors.grey[100],
            child: textBody3("${productDetailResDTO.tip}"),
          ),
          // SizedBox(height: 1000),
        ],
      ),
    ),
  );
}

SliverAppBar _appbar(ProductDetailResDTO productDetailResDTO) {
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
                  image: NetworkImage("${productDetailResDTO.picUrl}"),
                  fit: BoxFit.cover),
            ),
          ),
          title: isCollapsed
              ? Text(
            '${productDetailResDTO.productName}',
            style: TextStyle(color: Colors.black),
          )
              : null,
          centerTitle: true,
        );
      },
    ),
  );
}




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/model/Product.dart';

import 'product_outline_button.dart';

class ProductDetailPageBody extends StatelessWidget {
  ProductOrderReqDTO productOrderReqDTO;
  ProductDetailPageBody(this.productOrderReqDTO);

  @override
  Widget build(BuildContext context) {
    if(productOrderReqDTO.product.hotIce == 0){
      productOrderReqDTO.isIced = 0;
    }else if(productOrderReqDTO.product.hotIce == 1){
      productOrderReqDTO.isIced = 1;
    }

    // ProductDetailModel? model = ref.watch(productDetailProvider);
    // if (model == null) {
    //   return Center(child: CircularProgressIndicator());
    // } else {
    //   Product product = model.product;

    return CustomScrollView(
      slivers: [
        _appbar(productOrderReqDTO.product),
        _body(productOrderReqDTO),
      ],
    );
  }
}

SliverPadding _body(ProductOrderReqDTO productOrderReqDTO) {
  return SliverPadding(
    padding: EdgeInsets.all(16.0), // 패딩 설정
    sliver: SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitle1("${productOrderReqDTO.product.productName}"),
          textBody2("${productOrderReqDTO.product.productEngName}"),
          SizedBox(height: 10),
          textBody1(
            "${productOrderReqDTO.product.productDescription}",
          ),
          SizedBox(height: 10),
          // textTitle1("${productOrderReqDTO.beverage.price}원"),
          SizedBox(height: 10),
          if (productOrderReqDTO.product.hotIce==0)
            Row(
              children: [
                Expanded(
                    child:ProductOutlineButton ("HOT", kActiveColor2,productOrderReqDTO,false)),

              ],
            )
          else if(productOrderReqDTO.product.hotIce == 1)
            Row(
              children: [
                Expanded(child: ProductOutlineButton("ICED ONLY", kActiveColor1,productOrderReqDTO,true)),
              ],
            )
          else if(productOrderReqDTO.product.hotIce == 2)
              Row(
                children: [
                  Expanded(child: ProductOutlineButton("HOT", kActiveColor2,productOrderReqDTO,false)),
                  Expanded(child: ProductOutlineButton("ICE", kActiveColor1,productOrderReqDTO,true)),
                ],
              ),

          SizedBox(height: 10),
          if(productOrderReqDTO.product.hotIce != 3)
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            color: Colors.grey[100],
            child: textBody3("${productOrderReqDTO.product.productTip}"),
          ),
          // SizedBox(height: 1000),
        ],
      ),
    ),
  );
}

SliverAppBar _appbar(Product product) {
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
                  image: NetworkImage("${product.productPicUrl}"),
                  fit: BoxFit.cover),
            ),
          ),
          title: isCollapsed
              ? Text(
            '${product.productName}',
            style: TextStyle(color: Colors.black),
          )
              : null,
          centerTitle: true,
        );
      },
    ),
  );
}




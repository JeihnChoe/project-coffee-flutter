import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/ui/pages/main_page/main_page.dart';
import 'package:project_coffee/ui/pages/order_page/category_list_page/category_list_page.dart';
import 'package:project_coffee/ui/pages/order_page/shopping_cart_page/shopping_cart_page.dart';

class ProductDetailCartBottomSheet extends StatelessWidget {
  ProductOrderReqDTO productOrderReqDTO;
  ProductDetailCartBottomSheet({required this.productOrderReqDTO});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [

      ],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            title: Text("장바구니에 추가되었습니다.",style: TextStyle(color: Colors.black),),
            centerTitle: false,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(onPressed: () {
                Navigator.pop(context);
              }, icon: Icon(CupertinoIcons.xmark),color: Colors.black,)
            ],
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: kAccentColor),
                    minimumSize: Size(180, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShoppingCartPage()),
                    );
                  },child: Text("장바구니 가기",style: TextStyle(color: kAccentColor),),),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kAccentColor,
                    minimumSize: Size(180, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainPage(selectedIndex: 2,)),

                    );

                  },child: Text("다른 메뉴 더보기",style: TextStyle(color: Colors.white),),),
              ],
            ),
          )
        ],
      ),
    );
  }
}

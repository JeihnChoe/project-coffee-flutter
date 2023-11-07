import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/ui/pages/order_page/shopping_cart_beverage_page/shopping_cart_beverage_empty_page.dart';

class ShoppingCartBeveragePage extends StatefulWidget {
  List<BeverageOrderReqDTO> beverageOrderList = [];
  ShoppingCartBeveragePage(this.beverageOrderList, {Key? key});

  @override
  State<ShoppingCartBeveragePage> createState() =>
      _ShoppingBasketBeveragePageState();
}

class _ShoppingBasketBeveragePageState extends State<ShoppingCartBeveragePage> {
  List<bool> itemCheckedState = [];
  List<int> itemCounts = [1, 1, 1]; // 각 아이템의 수량을 나타내는 변수
  List<double> itemTotalPrice = [8000, 8000, 8000]; // 각 아이템의 총 가격을 나타내는 변수

  @override
  void initState() {
    super.initState();
    // 초기에 모든 아이템을 선택하지 않도록 false로 설정
    itemCheckedState = List.generate(3, (index) => false);
  }

  void removeItem(int index) {
    setState(() {
      itemTotalPrice.removeAt(index);
      itemCounts.removeAt(index);
      itemCheckedState.removeAt(index);
    });
  }

  void removeAllItems() {
    setState(() {
      itemTotalPrice.clear();
      itemCounts.clear();
      itemCheckedState.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 16.0),
          height: 110,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textTitle2("주문 메뉴"),
                    Text("총 주문 기능 수량 20개"),
                  ],
                ),
              ),
              SizedBox(height: gap_s),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: itemCheckedState.every((item) => item),
                          onChanged: (bool? value) {
                            setState(() {
                              for (var i = 0;
                                  i < itemCheckedState.length;
                                  i++) {
                                itemCheckedState[i] = value ?? false;
                              }
                            });
                          },
                          activeColor: kAccentColor,
                        ),
                        Text("전체선택",
                            style: TextStyle(fontSize: 13, color: Colors.grey)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            for (var i = itemCheckedState.length - 1;
                                i >= 0;
                                i--) {
                              if (itemCheckedState[i]) {
                                removeItem(i);
                              }
                            }
                          },
                          child: Text("선택삭제",
                              style: TextStyle(color: kAccentColor)),
                        ),
                        Container(
                          width: 1,
                          height: 15,
                          color: Colors.grey,
                        ),
                        TextButton(
                          onPressed: () {
                            removeAllItems();
                            // 여기서 페이지를 이동
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ShoppingCartBeverageEmptyPage(),
                              ),
                            );
                          },
                          child: Text("전체삭제",
                              style: TextStyle(color: Colors.grey)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(height: gap_m, color: Colors.grey[200]),
        Expanded(
          child: ListView.builder(
            itemCount: widget.beverageOrderList.length,
            itemBuilder: (context, index) {
              final beverageOrder =
                  widget.beverageOrderList[index]; // 현재 인덱스의 주문 정보

              return Container(
                height: 200,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                          value: itemCheckedState[index],
                          onChanged: (bool? value) {
                            setState(() {
                              itemCheckedState[index] = value ?? false;
                            });
                          },
                          activeColor: kAccentColor,
                        ),
                        IconButton(
                          onPressed: () {
                            removeItem(index);
                          },
                          icon: Icon(Icons.cancel_outlined),
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: Row(
                        children: [
                          ClipOval(
                            child: Image.network(
                              beverageOrder
                                  .beverage.beveragePicUrl, // 음료의 이미지 URL 사용
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: gap_xl),
                          SizedBox(
                            width: 220,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textTitle2(beverageOrder
                                    .beverage.beverageName), // 음료 이름 사용
                                Text(beverageOrder.beverage.beverageEngName,
                                    style: TextStyle(
                                        color: Colors.black45)), // 음료 유형 사용
                                SizedBox(height: gap_m),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text("아이스  ",
                                            style: TextStyle(
                                                color: Colors.black45)),
                                        Text("Tall  ",
                                            style: TextStyle(
                                                color: Colors.black45)),
                                        Text("개인컵",
                                            style: TextStyle(
                                                color: Colors.black45)),
                                      ],
                                    ),
                                    Text(
                                        beverageOrder.beverage.price
                                            .toString(), // 음료 가격 사용
                                        style:
                                            TextStyle(color: Colors.black45)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            if (itemCounts[index] != 1) {
                                              setState(() {
                                                itemCounts[index]--;
                                                itemTotalPrice[index] -=
                                                    beverageOrder
                                                        .beverage.price;
                                              });
                                            }
                                          },
                                          icon:
                                              Icon(CupertinoIcons.minus_circle),
                                          color: itemCounts[index] == 1
                                              ? Colors.grey
                                              : Colors.black,
                                        ),
                                        Text("${itemCounts[index]}"),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              itemCounts[index]++;
                                              itemTotalPrice[index] +=
                                                  beverageOrder.beverage.price;
                                            });
                                          },
                                          icon:
                                              Icon(CupertinoIcons.plus_circle),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        textTitle1("${itemTotalPrice[index]}"),
                                        SizedBox(width: 16),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Divider(
          color: Colors.grey[300],
          height: 3.0,
        ),
      ],
    );
  }
}

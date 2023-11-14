import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/ui/pages/order_page/shopping_cart_page/widget/shopping_cart_page_body.dart';
import 'package:project_coffee/ui/widgets/custom_white_pop_button.dart';

import 'shopping_cart_product_empty_page.dart';

class ShoppingCartProductPage extends StatefulWidget {
  final List<CartTotalDTO> cartTotalList;

  ShoppingCartProductPage(this.cartTotalList);

  @override
  State<ShoppingCartProductPage> createState() =>
      _ShoppingBasketProductPageState();
}

class _ShoppingBasketProductPageState extends State<ShoppingCartProductPage> {
  List<bool> itemCheckedState = [];
  List<int> itemCounts = []; // 각 아이템의 수량을 나타내는 변수
  List<int> itemTotalPrice = []; // 각 아이템의 총 가격을 나타내는 변수

  // 초기에 모든 아이템을 선택하지 않도록 false로 설정
  @override
  void initState() {
    super.initState();
    itemCheckedState =
        List.generate(widget.cartTotalList.length, (index) => false);
    itemCounts = List.generate(widget.cartTotalList.length,
        (index) => widget.cartTotalList[index].quantity);
    itemTotalPrice = List.generate(widget.cartTotalList.length,
        (index) => widget.cartTotalList[index].sumPrice);

    print('itemCounts: $itemCounts');
    print('itemTotalPrice: $itemTotalPrice');
  }

  int getCheckedItemCount() {
    return itemCheckedState.where((checked) => checked).length;
  }

  int getCheckedItemTotalPrice() {
    int totalItemPrice = 0;
    for (int i = 0; i < itemCheckedState.length; i++) {
      if (itemCheckedState[i]) {
        totalItemPrice += itemTotalPrice[i];
      }
    }
    return totalItemPrice;
  }

  int getCheckedItemAmount() {
    int totalAmount = 0;
    for (int i = 0; i < itemCheckedState.length; i++) {
      if (itemCheckedState[i]) {
        totalAmount += itemCounts[i];
        if (totalAmount > 20) {
          return 20; // 20을 넘으면 20으로 제한
        }
      }
    }
    return totalAmount;
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

  void updateTotalPrice() {
    int totalPrice = 0;
    for (int i = 0; i < itemTotalPrice.length; i++) {
      if (itemCheckedState[i]) {
        totalPrice += itemTotalPrice[i];
      }
    }
    setState(() {
      // 아이템 수량 업데이트
      itemTotalPrice = itemTotalPrice;
      itemCounts = itemCounts;
    });
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        print("까꿍 alert입니다.");
        return AlertDialog(
          content: textBody1("장바구니에 담을 수 있는 수량이\n초과 되었습니다.\n장바구니를 정리 해 주세요."),
          actions: [
            CustomWhitePopButton(text: "확인"),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                                updateTotalPrice();
                              });
                            },
                            activeColor: kAccentColor,
                          ),
                          Text("전체선택",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey)),
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
                                  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////삭제코드 쓰는곳
                                }
                              }
                              updateTotalPrice();
                            },
                            child: Text("선택삭제",
                                style: TextStyle(color: kAccentColor)),
                          ),
                          Container(
                            width: 1,
                            height: 15,
                            color: Colors.grey,
                          ),
                          Consumer(
                            builder: (context, ref, child) {
                              return TextButton(
                                onPressed: () {
                                  // ref.read()
                                  removeAllItems();
                                  
                                  //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////삭제코드 쓰는곳
                                  // 여기서 페이지를 이동
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ShoppingCartPageBody(cartTotalDTO: widget.cartTotalList),
                                    ),
                                  );
                                },
                                child: Text("전체삭제",
                                    style: TextStyle(color: Colors.grey)),
                              );
                            },
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
              itemCount: widget.cartTotalList.length,
              itemBuilder: (context, index) {
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
                                updateTotalPrice();
                              });
                            },
                            activeColor: kAccentColor,
                          ),
                          IconButton(
                            onPressed: () {
                              removeItem(index);
                              //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////삭제 기능 쓰는곳
                              updateTotalPrice();
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
                                "${widget.cartTotalList[index].picUrl}",
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
                                  textTitle2(
                                      "${widget.cartTotalList[index].name}"),
                                  Text("coffee",
                                      style: TextStyle(color: Colors.black45)),
                                  SizedBox(height: gap_m),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          if (widget.cartTotalList[index]
                                              .isIced ==
                                              0)
                                            Text("HOT ",
                                                style: TextStyle(
                                                    color: Colors.black45))
                                          else if(widget.cartTotalList[index]
                                              .isIced ==
                                              1)
                                            Text("Iced ",
                                                style: TextStyle(
                                                    color: Colors.black45))
                                          else
                                            Text(""),
                                          if(widget.cartTotalList[index].size== 1)
                                            Text("Short", style: TextStyle(color: Colors.black45))
                                          else if(widget.cartTotalList[index].size== 2)
                                            Text("Tall", style: TextStyle(color: Colors.black45))
                                          else if(widget.cartTotalList[index].size== 3)
                                            Text("Grande", style: TextStyle(color: Colors.black45))
                                          else if(widget.cartTotalList[index].size== 4)
                                            Text("Venti", style: TextStyle(color: Colors.black45))
                                          else if(widget.cartTotalList[index].size== 5)
                                            Text("Trenta", style: TextStyle(color: Colors.black45))
                                          else if(widget.cartTotalList[index].size== 6)
                                            Text("Solo", style: TextStyle(color: Colors.black45))
                                          else if(widget.cartTotalList[index].size== 7)
                                            Text("Doppio", style: TextStyle(color: Colors.black45))
                                          else
                                            Text("",),
                                          if(widget.cartTotalList[index].cupType == 1)
                                            Text("매장컵", style: TextStyle(color: Colors.black45))
                                          else if(widget.cartTotalList[index].cupType == 2)
                                            Text("개인컵", style: TextStyle(color: Colors.black45))
                                          else if(widget.cartTotalList[index].cupType == 3)
                                              Text("일회용컵", style: TextStyle(color: Colors.black45))
                                            else
                                                Text(""),
                                        ],
                                      ),
                                      Text("${widget.cartTotalList[index].price}",
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
                                              if (itemCounts[index] > 1) {
                                                setState(() {
                                                  itemCounts[index]--;
                                                  itemTotalPrice[index] -= widget.cartTotalList[index].price;
                                                  updateTotalPrice();
                                                });
                                                int totalItemCount =
                                                    itemCounts.fold(
                                                        0,
                                                        (acc, itemCount) =>
                                                            acc + itemCount);
                                                if (totalItemCount > 20) {
                                                  showAlertDialog(context);
                                                }
                                              }
                                            },
                                            icon: Icon(
                                                CupertinoIcons.minus_circle),
                                            color: (itemCounts[index] > 1)
                                                ? Colors.black
                                                : Colors.grey,
                                          ),
                                          Text("${itemCounts[index]}"),
                                          IconButton(
                                            onPressed: () {
                                              int totalItemCount =
                                                  itemCounts.fold(
                                                      0,
                                                      (acc, itemCount) =>
                                                          acc + itemCount);
                                              if (totalItemCount < 20) {
                                                setState(() {
                                                  itemCounts[index]++;
                                                  itemTotalPrice[index] += widget.cartTotalList[index].price;
                                                  updateTotalPrice();
                                                });
                                              } else {
                                                showAlertDialog(context);
                                              }
                                            },
                                            icon: Icon(
                                                CupertinoIcons.plus_circle),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          textTitle1(
                                              "${itemTotalPrice[index]}"),
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
        ],
      ),
      persistentFooterButtons: [
        Consumer(
          builder: (context, ref, child) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textBody1("총 ${getCheckedItemAmount()}/ 20개"),
                    textTitle1("${getCheckedItemTotalPrice()} 원"),
                  ],
                ),
                SizedBox(height: gap_m),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: kAccentColor,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "주문하기",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

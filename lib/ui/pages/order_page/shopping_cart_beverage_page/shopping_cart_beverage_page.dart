import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/ui/pages/order_page/shopping_cart_beverage_page/shopping_cart_beverage_empty_page.dart';
import 'package:project_coffee/ui/widgets/custom_white_pop_button.dart';

class ShoppingCartBeveragePage extends StatefulWidget {
  final List<BeverageOrderReqDTO> beverageOrderList;

  ShoppingCartBeveragePage(this.beverageOrderList, {Key? key})
      : super(key: key);

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
    itemCheckedState = List.generate(
        3, (index) => false); //3 대신 widget.beverageOrderList.length
    // itemCounts = List.generate(widget.beverageOrderList.length, (index) => 1);
    // itemTotalPrice =
    //     List.generate(widget.beverageOrderList.length, (index) => 8000);
  }

  int getCheckedItemCount() {
    return itemCheckedState.where((checked) => checked).length;
  }

  double getCheckedItemTotalPrice() {
    double totalItemPrice = 0;
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
    double totalPrice = 0;
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
              itemCount: itemTotalPrice.length,
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
                                "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000002950]_20210426150654756.jpg",
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
                                  textTitle2("내가 커피"),
                                  Text("coffee",
                                      style: TextStyle(color: Colors.black45)),
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
                                      Text("8000",
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
                                              if (itemCheckedState[index] &&
                                                  itemCounts[index] > 1) {
                                                setState(() {
                                                  itemCounts[index]--;
                                                  itemTotalPrice[index] -= 8000;
                                                  updateTotalPrice();
                                                });
                                                int totalItemCount =
                                                    itemCounts.fold(
                                                        0,
                                                        (acc, itemCount) =>
                                                            acc + itemCount);
                                                if (totalItemCount > 20) {
                                                  showAlertDialog(context);
                                                  setState(() {
                                                    itemCheckedState[index] =
                                                        false; // 해당 아이템 선택 해제
                                                  });
                                                }
                                              }
                                            },
                                            icon: Icon(
                                                CupertinoIcons.minus_circle),
                                            color: (itemCheckedState[index] &&
                                                    itemCounts[index] > 1)
                                                ? Colors.black
                                                : Colors.grey,
                                          ),
                                          Text("${itemCounts[index]}"),
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                itemCounts[index]++;
                                                itemTotalPrice[index] += 8000;
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

import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/widgets/custom_white_pop_button.dart';

class ShoppingCartBeveragePage extends StatefulWidget {
  // final List<BeverageOrderReqDTO> beverageOrderList;

  const ShoppingCartBeveragePage(/*this.beverageOrderList,*/ {Key? key});

  @override
  State<ShoppingCartBeveragePage> createState() =>
      _ShoppingBasketBeveragePageState();
}

class _ShoppingBasketBeveragePageState extends State<ShoppingCartBeveragePage> {
  List<bool> itemCheckedState = [];

  @override
  void initState() {
    super.initState();
    // 초기에 모든 항목을 false로 설정
    itemCheckedState =
        List.generate(/*widget.beverageOrderList.length,*/ 3, (index) => false);
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
                            if (itemCheckedState.contains(true)) {
                              setState(() {
                                itemCheckedState.removeWhere((item) => item);
                              });
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: AlertDialog(
                                      content: Text("장바구니에서 삭제하실 메뉴를\n선택해주세요."),
                                      actions: [
                                        CustomWhitePopButton(
                                          text: "확인",
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
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
                            setState(() {
                              itemCheckedState = List.generate(
                                  3, // widget.beverageOrderList.length,
                                  (index) => false);
                            });
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
              itemCount: 3, //widget.beverageOrderList.length,
              itemBuilder: (context, index) {
                //final beverageOrder = widget.beverageOrderList[index];
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
                              setState(() {
                                itemCheckedState[index] = false;
                                // 아이템 삭제 코드 추가
                                // widget.beverageOrderList.removeAt(index);
                              });
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
                                //beverageOrder.beverage.beveragePicUrl,
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
                                  textTitle2("내가 커피"
                                      // beverageOrder.beverage.beverageName
                                      ),
                                  Text(
                                    "coffee",
                                    //beverageOrder.beverage.beverageEngName,
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  SizedBox(height: gap_m),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "아이스  ",
                                            //beverageOrder.isIced.toString(),
                                            style: TextStyle(
                                                color: Colors.black45),
                                          ),
                                          Text(
                                            "Tall  ",
                                            //beverageOrder.size.toString(),
                                            style: TextStyle(
                                                color: Colors.black45),
                                          ),
                                          Text(
                                            "개인컵",
                                            //beverageOrder.cup.toString(),
                                            style: TextStyle(
                                                color: Colors.black45),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "8000",
                                        // beverageOrder.beverage.price.toString(),
                                        style: TextStyle(color: Colors.black45),
                                      ),
                                    ],
                                  ),
                                  dd
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
        Divider(
          color: Colors.grey[300],
          height: 3.0,
        ),
      ],
    );
  }
}

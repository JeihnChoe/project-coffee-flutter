import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/widgets/custom_white_pop_button.dart';

class ShoppingCartBeveragePage extends StatefulWidget {
  const ShoppingCartBeveragePage({super.key});

  @override
  State<ShoppingCartBeveragePage> createState() =>
      _ShoppingBasketBeveragePageState();
}

class _ShoppingBasketBeveragePageState extends State<ShoppingCartBeveragePage> {
  bool isSelectAll = false;
  bool showSecondContainer = true; // 두 번째 컨테이너를 보이거나 숨길 상태
  bool checkBoxValue = false; // 두 번째 컨테이너의 체크박스 상태

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 16.0),
          height: 110,
          color: Colors.white, // 음료/푸드 페이지 배경색
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
                          // 체크박스
                          value: isSelectAll,
                          onChanged: (bool? value) {
                            setState(() {
                              isSelectAll = value ?? false;
                              checkBoxValue = value ?? false;
                            });
                          },
                          activeColor: kAccentColor,
                        ),
                        Text("전체선택",
                            style: TextStyle(fontSize: 13, color: Colors.grey)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
                      children: [
                        TextButton(
                          onPressed: () {
                            if (isSelectAll || checkBoxValue) {
                              setState(() {
                                showSecondContainer = false;
                              });
                            } else {
                              // 선택된 체크박스가 없는 경우 알림창 표시
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
                          width: 1, // 수직선의 너비 (두께)
                          height: 15, // 수직선의 높이를 원하는 크기로 설정
                          color: Colors.grey, // 수직선의 색상
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              // showSecondContainer를 false로 설정하여 모든 컨테이너가 삭제되도록 합니다.
                              showSecondContainer = false;
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

        // 두 번째 컨테이너를 조건부로 표시
        if (showSecondContainer)
          Container(
            height: 200,
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: checkBoxValue,
                      onChanged: (bool? value) {
                        setState(() {
                          checkBoxValue = value ?? false;
                        });
                      },
                      activeColor: kAccentColor,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          showSecondContainer = false;
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
                          'https://picsum.photos/id/237/100/100',
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
                            textTitle2("제품이름 자리"),
                            Text(
                              "제품이름 영어 자리",
                              style: TextStyle(color: Colors.black45),
                            ),
                            SizedBox(height: gap_m),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "제품이름 자리",
                                  style: TextStyle(color: Colors.black45),
                                ),
                                Text(
                                  "가격",
                                  style: TextStyle(color: Colors.black45),
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
          ),
        Divider(
          color: Colors.grey[300], // 구분선의 색상 설정
          height: 3.0, // 구분선의 높이 설정
        ),
      ],
    );
  }
}

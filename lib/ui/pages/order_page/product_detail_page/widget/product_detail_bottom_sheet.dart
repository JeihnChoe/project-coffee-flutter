import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/store/order_store.dart';
import 'package:project_coffee/data/store/session_store.dart';
import 'package:project_coffee/ui/pages/order_page/product_detail_page/widget/bottom_sheet_outline_button_second.dart';

import '../../../other_page/other_main_page/widget/other_main_page_body_item.dart';
import 'bottom_sheet_outline_button_first.dart';
import 'bottom_sheet_outline_button_third.dart';
import 'bottom_sheet_sliver_appbar.dart';

class ProductDetailBottomSheet extends StatefulWidget {
  ProductDetailResDTO productDetailResDTO;
  ProductOrderReqDTO productOrderReqDTO;

  ProductDetailBottomSheet(
      {required this.productDetailResDTO, required this.productOrderReqDTO});

  @override
  State<ProductDetailBottomSheet> createState() =>
      ProductDetailBottomSheetState();
}

class ProductDetailBottomSheetState extends State<ProductDetailBottomSheet> {
  int selectedTabMethod = 1;
  int count = 1;
  int outlinbuttonchange = 1;

  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();

    widget.productOrderReqDTO.optionId = widget.productDetailResDTO.optionId;
    widget.productOrderReqDTO.cupType = 1;
    widget.productOrderReqDTO.quantity = 1;
    widget.productOrderReqDTO.totalPrice =
        widget.productDetailResDTO.optionPrice; //가격 넣어야함
    widget.productOrderReqDTO.sizePrice =
        widget.productDetailResDTO.optionPrice;
  }

  void updateChildState(int newValue) {
    setState(() {
      outlinbuttonchange = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // int? sizePrice = widget.productOrderReqDTO.option.price;

    return Scaffold(
      body: Container(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Container(color: Colors.white, child: SizedBox(height: 16)),
          ),
          BottomSheetSliverAppBar(
            productName: widget.productDetailResDTO.productName,
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  controller: controller,
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, top: 10, right: 10, bottom: 10),
                      width: double.infinity,
                      color: Color.fromRGBO(241, 250, 247, 1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "환경을 위해 일회용컵 사용 줄이기에 동참해주세요.",
                              style: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromRGBO(78, 155, 121, 1)),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (widget.productDetailResDTO.sizeType != 1)
                      textTitle2("사이즈"),
                    SizedBox(
                      height: 16,
                    ),
                    if (widget.productDetailResDTO.sizeType == 0)
                      BottomSheetOutlineButtonFirst(
                        productDetailResDTO: widget.productDetailResDTO,
                        productOrderReqDTO: widget.productOrderReqDTO, // DTO보내기
                        selectedTabMethod: outlinbuttonchange,
                        count: count,
                        onStateChange: updateChildState,
                      ) //디폴트 값
                    else if (widget.productDetailResDTO.sizeType == 2)
                      BottomSheetOutlineButtonSecond(
                        productDetailResDTO: widget.productDetailResDTO,
                        productOrderReqDTO: widget.productOrderReqDTO,
                        // DTO보내기
                        selectedTabMethod: outlinbuttonchange,
                        count: count,
                        onStateChange: updateChildState,
                      ) //디폴트 값
                    else
                      BottomSheetOutlineButtonThird(
                        //third는 없는걸로 바꿀꺼임
                        productOrderReqDTO: widget.productOrderReqDTO,
                      ),
                    //디폴트 값
                    SizedBox(
                      height: gap_l,
                    ),
                    textTitle2("컵 선택"),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedTabMethod = 1;
                                widget.productOrderReqDTO.cupType = 1;
                              });
                            },
                            child: Text(
                              "매장컵",
                              style: TextStyle(
                                  color: selectedTabMethod == 1
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: selectedTabMethod == 1
                                  ? kAccentColor
                                  : Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.circular(30))),
                              side: BorderSide(
                                  color: selectedTabMethod == 1
                                      ? kAccentColor
                                      : Colors.black,
                                  width: 0.5),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedTabMethod = 2;
                                widget.productOrderReqDTO.cupType = 2;
                              });
                            },
                            child: Text(
                              "개인컵",
                              style: TextStyle(
                                  color: selectedTabMethod == 2
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: selectedTabMethod == 2
                                  ? kAccentColor
                                  : Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                              side: BorderSide(
                                  color: selectedTabMethod == 2
                                      ? kAccentColor
                                      : Colors.black,
                                  width: 0.5),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedTabMethod = 3;
                                widget.productOrderReqDTO.cupType = 3;
                              });
                            },
                            child: Text(
                              "일회용컵",
                              style: TextStyle(
                                  color: selectedTabMethod == 3
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: selectedTabMethod == 3
                                  ? kAccentColor
                                  : Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30))),
                              side: BorderSide(
                                  color: selectedTabMethod == 3
                                      ? kAccentColor
                                      : Colors.black,
                                  width: 0.5),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: gap_m,
                    ),
                    if (selectedTabMethod == 2)
                      Container(
                        width: double.infinity,
                        height: 150,
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              orderText(
                                  "-주문 후, 개인컵(355ml 이상 텀블러 등)을 '음료 받는 곳'에 전달해 주세요."),
                              orderText(
                                  "-개인컵은 다회용기(텀블러, 머그 등)만 사용 가능하며 1회용기에는 음료 제공이 불가합니다."),
                              orderText("-개인컵을 선택한 경우 일회용 리드는 제공되지 않습니다."),
                              orderText(
                                  "-개인컵이 전달되지 않거나 전달된 개인컵이 주문한 음료를 담기 어려울 경우 (용량 미달, 좁은 투입구 등) 주문이 거절될 수 있습니다."),
                              orderText(
                                  "-차량에서 음료를 픽업하는 경우 개인컵 이용시에는 리드(뚜껑)을 파트너에게 함께 전달하여 주세요."),
                            ],
                          ),
                        ),
                      )
                    else if (selectedTabMethod == 3)
                      Container(
                        width: double.infinity,
                        height: 50,
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              orderText("매장에서 드시는 경우 일회용컵 사용이 불가능합니다."),
                              orderText("개인컵 또는 매장컵을 선택해 주시기 바랍니다."),
                            ],
                          ),
                        ),
                      ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
      persistentFooterButtons: [
        Column(
          children: [PersistentTopButton(), PersistentBottomButton(context)],
        )
      ],
    );
  }

  Row PersistentBottomButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.heart)),
        Row(
          children: [
            Consumer(
              builder: (context, ref, child) {
                SessionUser sessionUser = ref.read(sessionProvider);
                return OutlinedButton(
                  onPressed: () {
                    Logger().d(widget.productOrderReqDTO.toString());
                    Logger().d(widget.productOrderReqDTO.toJson());

                    if (sessionUser.jwt != null && sessionUser.jwt != "") {
                      ref.read(productProvider).cart(
                          context, sessionUser.jwt!, widget.productOrderReqDTO);
                    } else {
                      OtherShowDialog(context, "장바구니 담기", 1);
                    }
                    // showModalBottomSheet(

                    //                       context: context,
                    //                       isScrollControlled: true, // 이 옵션을 사용하여 BottomSheet가 화면의 90%까지 올라오게 합니다.
                    //                       builder: (context,) {
                    //                         return FractionallySizedBox(
                    //                           heightFactor: 0.20, // 높이를 20%로 설정
                    //                           child: ProductDetailCartBottomSheet(productOrderReqDTO: widget.productOrderReqDTO),
                    //                         );
                    //                       },
                    //                     );
                  },
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: BorderSide(
                        color: kAccentColor,
                      )),
                  child: Text(
                    "담기",
                    style: TextStyle(color: kAccentColor),
                  ),
                );
              },
            ),
            SizedBox(
              width: gap_m,
            ),
            // CustomAlertWindow(content: "주문할 매장을 선택해주세요.", buttonName1: "주문하기", buttonName2: "담기", clickButton: "뭐더라"),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kAccentColor,
                  minimumSize: Size(120, 25),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () =>
                    showDialog<String>(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Container(
                          width: 400,
                          height: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("주문할 매장을 선택해주세요"),
                              Text(
                                  "매장을 먼저 선택하신 후 주문해주세요. 판매 완료된 메뉴는 주문하실 수 없습니다."),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                side: BorderSide(
                                  color: kAccentColor,
                                )),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "취소",
                              style: TextStyle(color: kAccentColor),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: kAccentColor,
                              minimumSize: Size(150, 25),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => move1)); //이동할 페이지1
                            },
                            child: Text(
                              "매장 선택하기",
                              style: TextStyle(color: Colors.white),
                            ), //버튼이름1
                          ),
                        ],
                      ),
                    ),
                child: Text(
                  "주문하기",
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              width: gap_m,
            )
          ],
        ),
      ],
    );
  }

  Row PersistentTopButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (count != 1) {
                  setState(() {
                    count--;
                    widget.productOrderReqDTO.quantity = count;
                    widget.productOrderReqDTO.totalPrice =
                        widget.productOrderReqDTO.sizePrice! * count;
                  });
                }
              },
              icon: Icon(CupertinoIcons.minus_circle),
              color: count == 1 ? Colors.grey : Colors.black,
            ),
            Text("${widget.productOrderReqDTO.quantity}"),
            IconButton(
              onPressed: () {
                setState(() {
                  count++;
                  widget.productOrderReqDTO.quantity = count;
                  widget.productOrderReqDTO.totalPrice =
                      widget.productOrderReqDTO.sizePrice! * count;
                });
              },
              icon: Icon(CupertinoIcons.plus_circle),
            ),
          ],
        ),
        Row(
          children: [
            textTitle1("${widget.productOrderReqDTO.totalPrice}"),
            SizedBox(
              width: 16,
            )
          ],
        ),
      ],
    );
  }
}

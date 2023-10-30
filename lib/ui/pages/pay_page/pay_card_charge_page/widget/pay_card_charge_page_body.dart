import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/ui/widgets/custom_white_pop_button.dart';

class PayCardChargePageBody extends StatefulWidget {
  final PayCard paycard;
  PayCardChargePageBody(this.paycard, {super.key});

  @override
  _PayCardChargePageBodyState createState() => _PayCardChargePageBodyState();
}

class _PayCardChargePageBodyState extends State<PayCardChargePageBody> {
  // 선언된 라디오 버튼의 초기값
  int selectedPaymentMethod = 1;
  List<String> blockItems = ["1만원", "3만원", "5만원", "7만원", "10만원", "다른 금액"];
  String selectedBlock = ""; // 선택된 블록
  String selectedBlockAmount = "";
  int total = 0;
  void sum(String text) {
    if (text == "1만원") {
      total = 10000;
    } else if (text == "3만원") {
      total = 30000;
    } else if (text == "5만원") {
      total = 50000;
    } else if (text == "7만원") {
      total = 70000;
    } else if (text == "10만원") {
      total = 100000;
    } else if (text == "다른 금액") {}
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        PayCardChargeAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12),
                        image: DecorationImage(
                          image: NetworkImage("${widget.paycard.cardPicUrl}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: gap_l),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textBody1(""),
                        textBody1("${widget.paycard.cardName}"),
                        SizedBox(width: gap_s),
                        textTitle2("${widget.paycard.cardMoney}원"),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: gap_m),

                Divider(thickness: 1, color: Colors.black12), // 구분선

                Row(
                  children: [
                    SizedBox(height: gap_xl),
                    textTitle1("충전 금액"),
                    Spacer(),
                    textTitle1(selectedBlockAmount), // 클릭한 블록의 금액을 표시
                  ],
                ),

                SizedBox(height: gap_m),
                Wrap(
                  runSpacing: 10.0, // 줄 간 간격
                  alignment: WrapAlignment.start,
                  children: List<Widget>.generate(
                    (blockItems.length / 3).ceil(), // 3개씩 묶기
                    (int index) {
                      final start = index * 3;
                      final end = (index + 1) * 3;
                      return Row(
                        children: blockItems
                            .sublist(start, end)
                            .map((item) => Container(
                                  margin: EdgeInsets.only(
                                      right: 12.0), // 각 블록 간의 간격 조절
                                  child: buildBlock(item),
                                ))
                            .toList(),
                      );
                    },
                  ),
                ),

                SizedBox(height: gap_l),
                Divider(thickness: 1, color: Colors.black12), // 구분선

                Row(
                  children: [
                    SizedBox(height: gap_xl),
                    textTitle1("결제 수단"),
                  ],
                ),

                // 라디오 버튼 목록
                RadioListTile(
                  value: 1,
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value!;
                    });
                  },
                  title: textTitle2('신용카드'),
                ),
                RadioListTile(
                  value: 2,
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value!;
                    });
                  },
                  title: textTitle2('SSGPAY'),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textBody3(
                          "재충전 이후 거래 이력이 없는 경우, 충전일로부터 최대 7일내 온라인에서 충전 취소가 가능합니다."),
                    ],
                  ),
                ),
                SizedBox(height: gap_l),
                Divider(thickness: 1, color: Colors.black12), // 구분선
                ExpansionTile(
                  title: textTitle1(
                    '온라인 충전 시 유의사항',
                  ),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, top: 10, right: 10, bottom: 10),
                      width: double.infinity,
                      color: Colors.grey[100],
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textBody3(
                              "스타벅스카드 충전은 1회 1만원부터 55만원까지 가능하며, 충전 후 총액이 55만원을 초과할 수 없습니다."),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        // SliverList(delegate: delegate)
      ],
    );
  }

  // 각 블록을 생성하는 함수
  Widget buildBlock(String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBlock = text; // 클릭한 블록을 선택
          if (text == "다른 금액") {
            showCustomAmountDialog(); // 다른 금액 클릭시 Dialog 표시
          } else {
            selectedBlockAmount = text; // 클릭한 블록의 금액을 업데이트
            sum(text);
            Logger().d(total);
          }
        });
      },
      child: Container(
        width: 80,
        height: 50,
        decoration: BoxDecoration(
          color: selectedBlock == text ? kAccentColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12, width: 1),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: selectedBlock == text ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // 다른 금액을 입력하는 Custom Dialog 표시 함수
  void showCustomAmountDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String customAmount = ""; // 사용자가 입력한 금액을 저장할 변수

        return IntrinsicWidth(
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding:
                EdgeInsets.symmetric(vertical: 40, horizontal: 20), // 세로 여백 조절
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                textTitle2("충전 할 금액을 입력 해주세요."),
                TextField(
                  onChanged: (value) {
                    customAmount = value + "만원";
                    total = int.parse(value + "0000");
                  },
                  decoration: InputDecoration(
                    hintText: "충전금액(1만원 단위)",
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            actionsPadding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 10), // 버튼 여백 조절
            actions: [
              CustomWhitePopButton(text: "취소"),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: kAccentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    selectedBlockAmount = customAmount; // 입력한 금액으로 업데이트
                    Logger().d(total);
                    Navigator.of(context).pop(); // Dialog 닫기
                  });
                },
                child: Text(
                  "확인",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PayCardChargeAppBar extends StatelessWidget {
  const PayCardChargeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new),
        color: Colors.black,
      ),
      snap: false,
      expandedHeight: 90,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          "일반 충전",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        titlePadding: EdgeInsets.only(left: 16.0),
      ),
      centerTitle: false,
    );
  }
}

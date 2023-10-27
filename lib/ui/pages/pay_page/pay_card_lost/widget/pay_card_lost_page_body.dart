import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

class PayCardLostBody extends StatelessWidget {
  const PayCardLostBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: "분실 신고 및 잔액 이전"),
        SliverToBoxAdapter(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: 130,
                          height: 80,
                          child: Image.asset(
                            "assets/card.jpg",
                            fit: BoxFit.contain,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("수능기원"),
                          Text("300원",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                          SizedBox(height: 7,),
                          Text("****_****_**07-2976",style: TextStyle(fontSize: 12,color: Colors.grey),),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.only(left: 20,top: 10,right: 10,bottom: 10),
                    width: double.infinity,
                    color: Colors.grey[100],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textBody3("환불 가능 카드입니다."),
                      ],
                    ),
                  ),
                  SizedBox(height: gap_l,),
                  textTitle1("환불 신청 정책 안내"),
                  SizedBox(height: gap_m,),
                  Row(
                    children: [
                      Text("최종 충전 후 합계 잔액 :"),
                      Text("30,000원",style: TextStyle(color: Color.fromRGBO(110, 95, 76, 1)),),
                      Text("(2017.10.05)"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("환불 가능 최대 금액 :"),
                      Text("12,000원 이하",style: TextStyle(color: Color.fromRGBO(110, 95, 76, 1)),),
                      Text("(사용률 99.0%이상)"),
                    ],
                  ),
                  SizedBox(height: gap_m,),
                  Text("환불은 최종 충전 후 합계 잔액의 60% 이상이 사용된\n경우에만 가능하며, 60% 미만 사용시에는 잔액 이전만\n가능합니다."),
                  SizedBox(height: gap_l,),
                  Divider(),
                  textTitle1("분실 신고 시 유의사항"),

                  Text("- 환불 및 잔액이전은 분실 신고 후 진행하실 수 있습니다",style: TextStyle(fontSize: 13,color: Colors.grey),),
                  Text("- 분실 신고 시 이전에 발생한 충전은 결제취소가 불가합니다.",style: TextStyle(fontSize: 13,color: Colors.grey),),
                  Text("- 분실 신고 후 잔액 이전을 원하시는 경우, 휴대폰 본인 인증 완료 후 가능합니다.",style: TextStyle(fontSize: 13,color: Colors.grey),),
                  Text("- 등록 해지 버튼이 없는 카드의 '카드 삭제'를 원하실 경우 분실 신고 후 환불 및 잔액 이전을 통해 카드 삭제가 가능합니다.",style: TextStyle(fontSize: 13,color: Colors.grey),),
                  Text("- 스타벅스 카드를 이용하여 \"온라인스토어\"의 진행 중인 주문 내역등이 있는 경우 배송완료된 이후 해당 스타벅스 카드에 대해 환불을 신청할 수 있습니다.",style: TextStyle(fontSize: 13,color: Colors.grey),),

                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

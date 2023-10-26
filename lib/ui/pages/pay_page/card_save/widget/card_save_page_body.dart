import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';

class CardSaveBodyPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _cardName = TextEditingController();
  final _cardNumber = TextEditingController();
  final _pinNumber = TextEditingController();

  CardSaveBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new),
              color: Colors.black),
          snap: false,
          expandedHeight: 90,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              "카드 등록",
              style: TextStyle(color: Colors.black87),
            ),
            centerTitle: false,
            titlePadding: EdgeInsets.only(left: 16.0),
          ),
        ),
        SliverToBoxAdapter(
          child: TabBar(
            padding: EdgeInsets.only(right: 130,top: 15),
            indicatorColor: kAccentColor,// 선택된 탭의 표시선 색깔을 초록색으로 설정
            labelColor: Colors.black, // 선택된 탭의 텍스트 색깔을 검은색으로 설정
            unselectedLabelColor: Colors.grey, // 선택되지 않은 탭의 텍스트 색깔을 회색으로 설정
            tabs: [
              Tab(child: Text("스타벅스 카드",style: TextStyle(fontSize: 17),)),
              Tab(child: Text("카드 교환권",style: TextStyle(fontSize: 17),)),
            ],

          ),
        ),
        SliverFillRemaining(
          child: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextForm("CardName",validatorFunction:validateCardName, controller: _cardName),
                      SizedBox(height: gap_m,),
                      Text("카드명은 미입력 시 자동으로 부여됩니다.",style: TextStyle(color: Colors.grey,fontSize: 13),),
                      SizedBox(height: gap_l,),
                      CustomTextForm("CardNumber",validatorFunction:validateCardNumber, controller: _cardNumber),
                      SizedBox(height: gap_m,),
                      SizedBox(height: gap_l,),
                      CustomTextForm("PinNumber",validatorFunction:validatePinNumber, controller: _pinNumber),
                      SizedBox(height: gap_xxl,),
                      SizedBox(height: gap_xl,),
                      SizedBox(height: gap_m,),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        color: Colors.grey[100],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textBody3("스타벅스 카드 등록 시, 실물 카드와 카드 바코드 모두 사용 가능합\n니다."),
                            Row(
                              children: [
                                textBody3("카드가 없다면 e-Gift Card의"),
                                TextButton(onPressed: () {

                                }, child: Text("나에게 선물하기",style: TextStyle(fontSize: 11,color: kAccentColor),)),
                                textBody3("를 이용해보세요.")
                              ],
                            ),
                            textBody3("카드명은 미입력 시 자동으로 부여됩니다."),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: gap_l,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kAccentColor,
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => ),
                          // );

                        },
                        child: Text(
                          "등록하기",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),

                ),
              ),
              Center(child: Text("카드 교환권"),)

            ],
          ),
        )
      ],

    );
  }
}

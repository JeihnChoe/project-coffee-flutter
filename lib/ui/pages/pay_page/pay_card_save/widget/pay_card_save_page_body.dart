import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_save/widget/pay_card_save_form_field.dart';
import 'package:project_coffee/ui/widgets/custom_tab_bar.dart';


class PayCardSaveBodyPage extends StatelessWidget {
  final CardSaveFormField formField;
  PayCardSaveBodyPage(this.formField,{super.key});

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
          child:
          CustomTabBar(contentTitle1: "스타벅스 카드", contentTitle2: "카드 교환권"),
        ),
        SliverFillRemaining(
          child: TabBarView(
            children: [
              formField
              ,
              Center(
                child: Text("카드 교환권"),
              )
            ],
          ),
        )
      ],
    );
  }

}





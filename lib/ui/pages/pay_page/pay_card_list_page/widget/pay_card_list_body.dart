import 'package:flutter/material.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_list_page/widget/pay_card_list_body_item.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

class PayCardListBodyPage extends StatelessWidget {
  const PayCardListBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(title: "카드(숫자갯수)"),
          /*(숫자갯수) -> ${index}*/
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList.separated(
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) =>
                  PayCardListBodyItem(/*paycardList[index]*/),
              itemCount: 7 /*paycardList.length*/,
            ),
          ),
        ],
      ),
    );
  }
}

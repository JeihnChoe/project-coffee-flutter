import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/ui/widgets/custom_card.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

import 'promotion_detail_body_item.dart';

class PromotionDetailBody extends StatelessWidget {
  const PromotionDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        PromotionAppBar(),
        SliverToBoxAdapter(
          child: Card(
            child: Container(
              width: double.infinity,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 30.0),
                    child: textBody1("10월 24일, AUTOUMN PICNIC PICK!"),
                  ),
                  SizedBox(height: gap_m),

                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}


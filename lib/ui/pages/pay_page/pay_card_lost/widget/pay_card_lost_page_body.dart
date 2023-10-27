import 'package:flutter/material.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

class PayCardLostBody extends StatelessWidget {
  const PayCardLostBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: "분실 신고 및 잔액 이전")
      ],
    );
  }
}

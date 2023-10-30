import 'package:flutter/material.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

class PayCardUsageDetailsPageBody extends StatelessWidget {
  PayCardUsageDetailsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white, // 배경 색상 설정
        body: CustomScrollView(
          slivers: [
            CustomSliverAppBar(title: "이용내역"),
          ],
        ));
  }
}

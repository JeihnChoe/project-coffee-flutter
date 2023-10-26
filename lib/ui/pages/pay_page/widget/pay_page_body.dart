import 'package:flutter/material.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

class PayPageBody extends StatelessWidget {
  const PayPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: "Pay"),
        SliverToBoxAdapter()
      ],
    );
  }
}

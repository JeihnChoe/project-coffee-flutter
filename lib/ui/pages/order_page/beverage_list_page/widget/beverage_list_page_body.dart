import 'package:flutter/material.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

class BeverageListPageBody extends StatelessWidget {
  const BeverageListPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(title: "pay",),
        ],
      ),
    );
  }
}

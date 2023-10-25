import 'package:flutter/material.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';
import 'package:project_coffee/ui/widgets/xmark_button.dart';

class FindLoginIdBody extends StatelessWidget {
  const FindLoginIdBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        XmarkAppBar(),
      ],
    );
  }
}

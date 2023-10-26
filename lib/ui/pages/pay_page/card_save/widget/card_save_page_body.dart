import 'package:flutter/material.dart';
import 'package:project_coffee/ui/widgets/custom_sliver_app_bar.dart';

class CardSaveBodyPage extends StatelessWidget {
  const CardSaveBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: "카드 등록"),
        SliverAppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car,color: Colors.black,)),
              Tab(icon: Icon(Icons.directions_transit,color: Colors.black,)),
            ],

          ),

        ),
        SliverToBoxAdapter(
          child: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        )



      ],

    );
  }
}

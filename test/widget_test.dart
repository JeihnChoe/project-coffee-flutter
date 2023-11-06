import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';

class ProductListPageBody extends StatefulWidget {

  const ProductListPageBody({super.key});

  @override
  State<ProductListPageBody> createState() => _ProductListPageBodyState();
}

class _ProductListPageBodyState extends State<ProductListPageBody> {
  late String lat;
  late String long;

  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      slivers: [
        SliverAppBar(

          snap: true,
          floating: true,
          title: Text("SliverAppBar"),
          pinned: false,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("제목"),
            centerTitle: true,
            background: Image.network(
              'https://picsum.photos/200/300',
              fit: BoxFit.cover,
            ),
          ),
        ),

        //  SliverAppBar(
        //   title: Text("pinned"),
        //   pinned: true,
        //   centerTitle: true,
        // ),
      ],
    );
  }
}

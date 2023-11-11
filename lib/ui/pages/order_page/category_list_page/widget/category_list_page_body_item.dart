import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/model/category.dart';
import 'package:project_coffee/ui/pages/order_page/product_list_page/product_list_page.dart';



class CategoryListPageBodyItem extends StatelessWidget {
  Category category;
  CategoryListPageBodyItem(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductListPage(category)));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 5,bottom: 15, right: 16),
          child: Container(
            height: 75,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _image(),
                SizedBox(width: gap_m),
                _Category(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _Category() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textTitle2(
            "${category.name}",
          ),
          SizedBox(height: gap_m),
          textBody3("${category.engName}")
        ],
      ),
    );
  }

  _image() {
    return Container(
      width: 100,
      height: 90,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: NetworkImage("${category.picUrl}"),
            fit: BoxFit.cover),
      ),
    );
  }
}

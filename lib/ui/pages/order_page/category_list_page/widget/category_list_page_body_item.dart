import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/category.dart';

import '../../beverage_list_page/beverage_list_page.dart';

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
                  builder: (context) => BeverageListPage(category)));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 5, left: 16, right: 16),
          child: Container(
            height: 100,
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
            "${category.categoryName}",
          ),
          SizedBox(height: gap_m),
          textBody3("${category.categoryEngName}")
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
            image: NetworkImage("${category.categoryPicUrl}"),
            fit: BoxFit.cover),
      ),
    );
  }
}

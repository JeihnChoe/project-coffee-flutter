import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/beverage.dart';

import '../../../../../_core/constants/size.dart';

class CategoryBeverageListPageBodyItem extends StatelessWidget {
  Beverage beverage;
  CategoryBeverageListPageBodyItem(this.beverage,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        // onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => BeverageListPage(category)));
        // },
        child: Padding(
          padding: const EdgeInsets.only(top: 5,bottom: 15, right: 16),
          child: Container(
            height: 80,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _image(beverage),
                SizedBox(width: gap_m),
                _Beverage(beverage),
              ],
            ),
          ),
        ),
      ),
    );
  }
  }

_Beverage(Beverage beverage) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textTitle2(
          "${beverage.beverageName}",
        ),
        SizedBox(height: gap_m),
        textBody3("${beverage.beverageEngName}")
      ],
    ),
  );
}

_image(Beverage beverage) {
  return Container(
    width: 100,
    height: 90,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
          image: NetworkImage("${beverage.beveragePicUrl}"),
          fit: BoxFit.cover),
    ),
  );
}

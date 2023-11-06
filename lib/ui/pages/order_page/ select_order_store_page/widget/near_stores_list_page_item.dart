import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/stroes.dart';

class NearStoresListPageItem extends StatelessWidget {
  Stores stores;
  NearStoresListPageItem({required this.stores});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => BeverageListPage(category)));
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
            "${stores.storeName}",
          ),
          SizedBox(height: gap_m),
          textBody3("${stores.address}")
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
            image: NetworkImage("${stores.storePicUrl}"),
            fit: BoxFit.cover),
      ),
    );
  }
}


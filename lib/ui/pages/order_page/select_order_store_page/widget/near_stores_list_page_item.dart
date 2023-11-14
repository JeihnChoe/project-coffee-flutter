import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/data/model/stroes.dart';
import 'package:project_coffee/ui/pages/order_page/select_order_store_page/widget/stores_detail_bottom_sheet.dart';

class NearStoresListPageItem extends StatelessWidget {
  Stores stores;
  NearStoresListPageItem({required this.stores});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled:
                true, // 이 옵션을 사용하여 BottomSheet가 화면의 90%까지 올라오게 합니다.
            builder: (context) {
              return FractionallySizedBox(
                heightFactor: 0.95, // 높이를 90%로 설정
                child: StoresDetailBottomSheet(stores: stores),
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 15, right: 16),
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
        shape: BoxShape.rectangle,
        image: DecorationImage(
            image: NetworkImage("${stores.storePicUrl}"), fit: BoxFit.cover),
      ),
    );
  }
}

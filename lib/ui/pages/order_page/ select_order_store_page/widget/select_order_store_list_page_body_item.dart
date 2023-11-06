import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/model/stroes.dart';
import 'package:project_coffee/ui/pages/order_page/%20select_order_store_page/select_order_store_page_view_model.dart';
import 'package:project_coffee/ui/pages/order_page/%20select_order_store_page/widget/near_stores_list_page_item.dart';

class FrequentStoresPage extends StatelessWidget {
  const FrequentStoresPage({super.key});



  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        StoresListModel? model = ref.watch(StoresListProvider);
        List<Stores> storesList = model?.storesList ?? [];
        // final code1Items = categoryList.where((item) => item.code == code).toList();  //이거는 가까운곳 조건문 하려고 주석처리한거임 지우지마셈

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) =>
                      NearStoresListPageItem(stores: storesList[index]),
                  childCount: storesList.length,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

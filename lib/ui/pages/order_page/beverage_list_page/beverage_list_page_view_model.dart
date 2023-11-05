
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/beverage.dart';
import 'package:project_coffee/data/repository/beverage_repostory.dart';

import 'package:project_coffee/main.dart';
//창고 데이터
class BeverageListModel {
  List<Beverage> BeverageList;

  BeverageListModel(this.BeverageList);
}

//창고
class BeverageListViewModel extends StateNotifier<BeverageListModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  BeverageListViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO =
    await BeverageRepository().fetchBeverageDetailList();
    state = BeverageListModel(responseDTO.response);
  }
}

//창고관리자
final BeverageListProvider =
StateNotifierProvider<BeverageListViewModel, BeverageListModel?>((ref) {
  return BeverageListViewModel(null, ref)..notifyInit();
});



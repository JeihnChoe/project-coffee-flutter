
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/beverage.dart';
import 'package:project_coffee/data/repository/category_repository.dart';
import 'package:project_coffee/main.dart';

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
    await CategoryRepository().fetchCategoryDetailList();
    state = BeverageListModel(responseDTO.response);
  }
}

//창고관리자
final BeverageListProvider =
StateNotifierProvider<BeverageListViewModel, BeverageListModel?>((ref) {
  return BeverageListViewModel(null, ref)..notifyInit();
});



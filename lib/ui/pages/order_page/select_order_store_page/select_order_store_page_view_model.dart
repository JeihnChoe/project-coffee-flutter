import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/category.dart';
import 'package:project_coffee/data/model/stroes.dart';
import 'package:project_coffee/data/repository/category_repository.dart';
import 'package:project_coffee/data/repository/stores_repository.dart';
import 'package:project_coffee/main.dart';

class StoresListModel {
  List<Stores> storesList;

  StoresListModel(this.storesList);
}

//창고
class StoresListViewModel extends StateNotifier<StoresListModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  StoresListViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO =
    await StoresRepository().fetchStoresDetailList();
    state = StoresListModel(responseDTO.response);


  }
}

//창고관리자
final StoresListProvider =
StateNotifierProvider<StoresListViewModel, StoresListModel?>((ref) {
  return StoresListViewModel(null, ref)..notifyInit();
});

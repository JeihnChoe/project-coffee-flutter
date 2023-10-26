import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/category.dart';
import 'package:project_coffee/data/repository/category_repository.dart';
import 'package:project_coffee/main.dart';

class CategoryListModel {
  List<Category> categoryList;

  CategoryListModel(this.categoryList);
}

//창고
class CategoryListViewModel extends StateNotifier<CategoryListModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  CategoryListViewModel(super.state, this.ref);

  Future<void> notifyInit() async {
    ResponseDTO responseDTO =
        await CategoryRepository().fetchCategoryDetailList();
    state = CategoryListModel(responseDTO.response);
  }
}

//창고관리자
final categoryListProvider =
    StateNotifierProvider<CategoryListViewModel, CategoryListModel?>((ref) {
  return CategoryListViewModel(null, ref)..notifyInit();
});

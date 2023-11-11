import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/data/model/promotion.dart';
import 'package:project_coffee/data/store/session_store.dart';
import 'package:project_coffee/ui/pages/home_page/promotion_list_page/promotion_list_page_view_model.dart';

// 1. 창고 데이터
class HomeModel {
  final bool isLogin;
  final List<Promotion> promotionList;

  HomeModel({required this.isLogin, required this.promotionList});
}

// 2. 창고 관리자
class HomeViewModel extends StateNotifier<HomeModel?> {
  final SessionStore sessionStore;

  HomeViewModel(this.sessionStore) : super(null);

  Future<void> notifyInit(Ref<Object?> ref) async {
    bool isLogin = sessionStore.isLogin;
    Logger().d("로그인 여부: $isLogin");

    PromotionListModel? promotionListModel = ref.watch(promotionListProvider);
    List<Promotion> promotionList = promotionListModel?.promotionList ?? [];
    state = HomeModel(isLogin: isLogin, promotionList: promotionList);

    // 리렌더링 유도
    ref.read(homeProvider.notifier).notifyInit(ref);

    Logger().d("상태 갱신 $isLogin");
  }
}

final homeProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeModel?>((ref) {
  final homeViewModel = HomeViewModel(ref.read(sessionProvider));
  homeViewModel.notifyInit(ref);
  return homeViewModel;
});

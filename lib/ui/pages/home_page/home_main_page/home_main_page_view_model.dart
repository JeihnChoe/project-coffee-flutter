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
  final Ref ref;
  final SessionStore sessionStore;

  HomeViewModel(this.ref, this.sessionStore) : super(null);

  // 홈 페이지 초기화 및 데이터 로딩
  Future<void> notifyInit() async {
    bool isLogin = sessionStore.isLogin;
    Logger().d("로그인 여부: $isLogin");

    PromotionListModel? promotionListModel = ref.watch(promotionListProvider);
    // promotionListModel이 null이 아닌 경우 promotionList를 가져옴
    List<Promotion> promotionList = promotionListModel?.promotionList ?? [];
    Logger().d("프로모션 리스트: $promotionList");
    state = HomeModel(isLogin: isLogin, promotionList: promotionList);

    // 리렌더링 유도
    ref.read(homeProvider.notifier).state = state;

    Logger().d("상태 갱신 $isLogin");
  }
}

// 3. 창고 관리자
final homeProvider = StateNotifierProvider<HomeViewModel, HomeModel?>((ref) {
  return HomeViewModel(
    ref,
    ref.watch(sessionProvider),
  )..notifyInit(); // 초기화 메서드 호출
});

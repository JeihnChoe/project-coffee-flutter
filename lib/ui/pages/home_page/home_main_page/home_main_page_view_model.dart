// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:logger/logger.dart';
// import 'package:project_coffee/data/model/promotion.dart';
// import 'package:project_coffee/data/store/session_store.dart';
// import 'package:project_coffee/main.dart';
// import 'package:project_coffee/ui/pages/home_page/promotion_list_page/promotion_list_page_view_model.dart';
//
// // 1. 창고 데이터
// class HomeModel {
//   final bool isLogin;
//   final List<Promotion> promotionList;
//
//   HomeModel({required this.isLogin, required this.promotionList});
// }
//
// class HomeViewModel extends StateNotifier<HomeModel> {
//   final SessionStore sessionStore;
//   final Ref ref;
//
//   HomeViewModel(this.sessionStore, this.ref)
//       : super(HomeModel(isLogin: false, promotionList: []));
//
//   Future<void> notifyInit() async {
//     bool isLogin = sessionStore.isLogin;
//     Logger().d("로그인 여부: $isLogin");
//
//     PromotionListModel? promotionListModel = ref.watch(promotionListProvider);
//     List<Promotion> promotionList = promotionListModel?.promotionList ?? [];
//
//     state = HomeModel(isLogin: isLogin, promotionList: promotionList);
//
//     // 불필요한 초기화 방지
//     if (isLogin) {
//       ref.read(homeProvider.notifier).notifyInit();
//     }
//
//     Logger().d("상태 갱신 $isLogin");
//   }
// }
//
// final homeProvider = StateNotifierProvider<HomeViewModel, HomeModel>((ref) {
//   final sessionStore = ref.read(sessionProvider);
//   final homeViewModel = HomeViewModel(sessionStore, ref);
//
//   // notifyInit 메서드를 호출하여 초기화 작업 수행
//   homeViewModel.notifyInit();
//
//   return homeViewModel;
// });
// final loginStateProvider = Provider<bool>((ref) {
//   // 로그인 상태 확인
//   HomeModel homeModel = ref.watch(homeProvider);
//   return homeModel.isLogin;
// });

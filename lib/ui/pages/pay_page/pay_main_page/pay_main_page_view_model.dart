// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:project_coffee/main.dart';
//
// //창고데이터
// class PayCardSaveModel {}
//
// //창고
// class PayCardSaveViewModel extends StateNotifier<PayCardSaveModel?> {
//   final mContext = navigatorKey.currentContext;
//   final Ref ref;
//
//   PayCardSaveViewModel(PayCardSaveModel? state, this.ref) : super(state);
//
//   Future<void> notifyInit(String? token) async {}
// }
//
// // paycardListProvider를 Provider.family로 수정
// final paycardSaveProvider =
//     Provider.family<PayCardSaveViewModel, PayCardSaveModel?>((ref, token) {
//   return PayCardSaveViewModel(null, ref)..notifyInit();
// });

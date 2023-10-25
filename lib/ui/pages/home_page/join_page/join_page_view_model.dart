// // 1. 창고데이터
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:project_coffee/data/dto/reponse_dto.dart';
// import 'package:project_coffee/data/dto/user_request.dart';
// import 'package:project_coffee/data/model/user.dart';
// import 'package:project_coffee/data/repository/user_repository.dart';
//
// class JoinModel{
//   User user;
//   JoinModel(this.user);
//
// }
// // 2. 창고
//
// class JoinViewModel extends StateNotifier<JoinModel?> {
//   final Ref ref;
//   JoinViewModel(this.ref, super.state);
//
//
//   Future<void> notifyInit(JoinReqDTO joinReqDTO) async {
//     ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);
//     // ResponseDTO responseDTO = await UserRepository().fetchJoin();
//     // print("response : ${responseDTO.response}");
//     // print("success : ${responseDTO.success}");
//     // print("error : ${responseDTO.error}");
//     // state = JoinModel(responseDTO.response);
//
//   }
//
//   // Future<void> notifyInit(int id) async {
//   //   // Logger().d("레파지토리 : 통신요청");
//   //
//   //   ResponseDTO responseDTO = await ProductRepository().fetchProductDetail();
//   //   Logger().d("레파지토리 : ${responseDTO.response.runtimeType}");
//   //
//   //   state = ProductDetailModel(responseDTO.response);
//   // }
// }
//
// // 3. 창고관리자
// final JoinProvider = StateNotifierProvider.autoDispose<JoinViewModel,JoinModel?>((ref) {
//   return JoinViewModel(ref,null)..notifyInit(joinReqDTO);
// });
//
// // final productDetailProvider = StateNotifierProvider.autoDispose<
// //     ProductDetailViewModel, ProductDetailModel?>((ref) {
// //   Logger().d("productDetailProvider");
// //   int productId = ref.read(paramProvider).productDetailId!;
// //   Logger().d("productDetailProvider - 후반");
// //   return ProductDetailViewModel(ref, null)..notifyInit(productId!);
// // });

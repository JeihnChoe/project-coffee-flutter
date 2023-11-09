import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/http.dart';
import 'package:project_coffee/data/model/paycard.dart';

class CardRepository {
  // Future<ResponseDTO> fetchCardDetail() {
  //   return Future.delayed(Duration(seconds: 3), () => mCardResponseDTO);
  // }

  Future<List<PayCard>> fetchCardDetailList(String? token) async {
    try {
      Options options = Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      Response<dynamic> response = await dio.get(
        "/api/cards/viewcardlistpage",
        options: options,
      );
      Logger().d("카드통신?${response.data}");

      if (response.data != null && response.data is Map<String, dynamic>) {
        dynamic responseData = response.data["response"];

        if (responseData != null && responseData is List) {
          List<PayCard> paycardList =
              responseData.map((e) => PayCard.fromjson(e)).toList();
          Logger().d("카드 통신?할게요");
          return paycardList;
        } else {
          throw Exception("서버 응답 형식 오류: 'response' 키가 리스트가 아닙니다");
        }
      } else {
        throw Exception("서버 응답 형식 오류: 응답이 맵이 아닙니다");
      }
    } catch (e) {
      // 오류 처리를 수행할 수 있습니다.
      throw Exception(e);
    }
  }
}

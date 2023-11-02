import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/http.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/mock/paycard.dart';
import 'package:project_coffee/data/model/paycard.dart';

class CardRepository {
  Future<ResponseDTO> fetchCardDetail() {
    return Future.delayed(Duration(seconds: 3), () => mCardResponseDTO);
  }

  Future<List<PayCard>> fetchCardDetailList() async {
    try {
      Response<dynamic> response = await dio.get("/api/cards/viewcardlistpage");
      Logger().d("통신?${response.data}");

      if (response.data != null && response.data is List) {
        List<dynamic> bodyList = response.data as List<dynamic>;
        List<PayCard> paycardList =
            bodyList.map((e) => PayCard.fromjson(e)).toList();
        Logger().d("통신?할게요");
        return paycardList;
      } else {
        // 서버 응답이 Promotion 목록이 아닌 경우 처리
        throw Exception("Invalid server response format");
      }
    } catch (e) {
      // 오류 처리를 수행할 수 있습니다.
      throw Exception(e);
    }
  }
}

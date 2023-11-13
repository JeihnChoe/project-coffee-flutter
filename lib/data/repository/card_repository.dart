import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/http.dart';
import 'package:project_coffee/data/dto/card_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/paycard.dart';

class CardRepository {
  // Future<ResponseDTO> fetchCardDetail() {
  //   return Future.delayed(Duration(seconds: 3), () => mCardResponseDTO);
  // }

  Future<ResponseDTO> fetchCardSave(CardSaveReqDTO cardSaveReqDTO, String? token) async {
    try {
      // 카드 저장 요청 헤더에 토큰 추가
      Options options = Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      // dynamic -> http body
      Response<dynamic> response = await dio.post(
        "/api/cards/cardregistrationpage",
        data: cardSaveReqDTO.toJson(),
        options: options,
      );

      // 서버 응답을 ResponseDTO로 변환
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("카드 등록 결과: $responseDTO");

      return responseDTO;
    } catch (e) {
      // Dio 요청 중 예외 발생 시 처리
      Logger().e("카드 등록 중 오류: $e");

      // 카드 등록에 실패한 경우 에러 응답 반환
      return ResponseDTO(false, "카드 등록에 실패했습니다", null);
    }
  }



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

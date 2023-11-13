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

  Future<ResponseDTO> fetchCardSave(CardSaveReqDTO cardSaveReqDTO) async {
    try {
      // dynamic -> http body
      Response<dynamic> response = await dio.post(
        "/api/cards/cardregistrationpage",
        data: cardSaveReqDTO.toJson(),
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

  Future<List<PayCard>> fetchCardDetailList() async {
    Response<dynamic> response = await dio.get("/api/cards/viewcardlistpage");
    Logger().d("카드통신?${response}");
    Logger().d("카드통신?${response.data}");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    // List<dynamic> mapList = responseDTO.data as List<dynamic>;
    // List<Post> postList = mapList.map((e) => Post.fromJson(e)).toList();

    List<dynamic> mapList = responseDTO.response as List<PayCard>;
    List<PayCard> cardList = mapList.map((e) => PayCard.fromjson(e)).toList();
    return cardList;

    //
    //   if (response.data != null && response.data is Map<String, dynamic>) {
    //     dynamic responseData = response.data["response"];
    //
    //     if (responseData != null && responseData is List) {
    //       List<PayCard> paycardList =
    //           responseData.map((e) => PayCard.fromjson(e)).toList();
    //       Logger().d("카드 통신?할게요");
    //       return paycardList;
    //     } else {
    //       throw Exception("서버 응답 형식 오류: 'response' 키가 리스트가 아닙니다");
    //     }
    //   } else {
    //     throw Exception("서버 응답 형식 오류: 응답이 맵이 아닙니다");
    //   }
    // } catch (e) {
    //   // 오류 처리를 수행할 수 있습니다.
    //   throw Exception(e);
    // }
  }
}

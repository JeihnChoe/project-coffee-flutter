import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/http.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/mock/promotion.dart';
import 'package:project_coffee/data/model/promotion.dart';

class PromotionRepository {
  Future<ResponseDTO> fetchPromotionDetail() {
    return Future.delayed(Duration(seconds: 3), () => mPromotionResponseDTO);
  }

  Future<List<Promotion>> fetchPromotionDetailList() async {
    try {
      Response<dynamic> response =
          await dio.get("/api/promotion/viewpromotionlist");
      Logger().d("프로모션통신?${response.data}");

      if (response.data != null && response.data is List) {
        List<dynamic> bodyList = response.data as List<dynamic>;
        List<Promotion> promotionList = bodyList
            .map((e) => Promotion.fromJson(e)) // Promotion 모델에 따라 변환
            .toList();
        Logger().d("프로모션 통신?할게요");
        return promotionList;
      } else {
        // 서버 응답이 Promotion 목록이 아닌 경우 처리
        throw Exception("Invalid server response format");
      }
    } catch (e) {
      // 오류 처리를 수행할 수 있습니다.
      throw Exception("Failed to fetch promotion list: $e");
    }
  }
}

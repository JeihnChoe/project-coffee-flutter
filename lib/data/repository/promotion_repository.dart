import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/mock/promotion.dart';

class PromotionRepository {
  Future<ResponseDTO> fetchPromotionDetail() {
    return Future.delayed(Duration(seconds: 3), () => mPromotionResponseDTO);
  }

  Future<ResponseDTO> fetchPromotionDetailList() {
    return Future.delayed(
        Duration(seconds: 3), () => mPromotionListResponseDTO);
  }
}

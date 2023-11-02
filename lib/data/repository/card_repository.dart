import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/mock/paycard.dart';

class CardRepository {
  Future<ResponseDTO> fetchCardDetail() {
    return Future.delayed(Duration(seconds: 3), () => mCardResponseDTO);
  }

  Future<ResponseDTO> fetchCardDetailList() {
    return Future.delayed(Duration(seconds: 3), () => mCardListResponseDTO);
  }
}

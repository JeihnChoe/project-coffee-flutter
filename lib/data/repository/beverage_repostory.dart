import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/mock/beverage.dart';

class BeverageRepository {
  Future<ResponseDTO> fetchBeverageDetail() {
    return Future.delayed(Duration(seconds: 3), () => mBeverageResponseDTO);
  }

  Future<ResponseDTO> fetchBeverageDetailList() {
    return Future.delayed(Duration(seconds: 3), () => mBeverageListResponseDTO);
  }

  Future<ResponseDTO> fetchBeverageDetailAndOrder() {
    return Future.delayed(
        Duration(seconds: 3), () => mBeverageOrderResponseDTO);
  }

  fetchBeverageOrderList() {}
}

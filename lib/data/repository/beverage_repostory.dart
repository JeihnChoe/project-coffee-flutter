
import 'package:dio/dio.dart';
import 'package:project_coffee/_core/constants/http.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/mock/beverage.dart';


class BeverageRepository {
  Future<ResponseDTO> fetchBeverageDetail() {
    return Future.delayed(Duration(seconds: 3), () => mBeverageResponseDTO);
  }

  Future<ResponseDTO> fetchBeverageDetailList() {
    return Future.delayed(Duration(seconds: 3), () => mBeverageListResponseDTO);
  }

  Future<ResponseDTO> fetchBeverageCartSave(BeverageOrderReqDTO beverageOrderReqDTO) async{
    try {
      // dynamic -> http body
      Response<dynamic> response =
      await dio.post("/api/carts/add", data: beverageOrderReqDTO.toJson());
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      // responseDTO.response = User.fromJson(responseDTO.response);

      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(false, "잘못된 방법입니다.", null);
    }
    return Future.delayed(Duration(seconds: 3), () => mBeverageOrderResponseDTO);
  }

}

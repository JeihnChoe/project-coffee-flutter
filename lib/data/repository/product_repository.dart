import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/product.dart';

import '../../_core/constants/http.dart';

class ProductRepository {
  // Future<void> fetchProductDetail() {
  //   return Future.delayed(Duration(seconds: 3), () => product);
  // }

  Future<ResponseDTO> fetchProductList() async {
    try {
      final response = await dio.get("/products");
      Logger().d(response);
      Logger().d("레파지토리 : 통신완료, 파싱시작");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      Logger().d("레파지토리 : 최초파싱완료");
      List<dynamic> mapProductList = responseDTO.response as List<dynamic>;
      Logger().d("레파지토리 : 파싱 후 맵 변환 완료");
      Logger().d("${mapProductList.runtimeType}");
      List<Product> productList =
          mapProductList.map((e) => Product.fromJson(e)).toList();

      responseDTO.response = productList;
      Logger().d("레파지토리 : 통신완료, 파싱완료");
      Logger().d("레파지토리 : 리턴 responseDTO ${responseDTO}");
      return responseDTO;
    } catch (e) {
      Logger().d("레파지토리 : 통신실패");

      return ResponseDTO(false, null, null);
    }
  }
}

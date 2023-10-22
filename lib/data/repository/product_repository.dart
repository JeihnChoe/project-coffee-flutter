import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/product.dart';

import '../../_core/constants/http.dart';

class ProductRepository {
  Future<ResponseDTO> fetchProductDetail() async {
    try {
      Logger().d("레파지토리 : 통신요청");
      final response = await dio.get("/products/10");

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.response = Product.fromJson(responseDTO.response);
      return responseDTO;

      // ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      // Product product = responseDTO.response as Product;
      // responseDTO.response = product;
    } catch (e) {
      return ResponseDTO(false, null, null);
    }
  }

  Future<ResponseDTO> fetchProductList() async {
    try {
      final response = await dio.get("/products");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      List<dynamic> mapProductList = responseDTO.response as List<dynamic>;
      List<Product> productList =
          mapProductList.map((e) => Product.fromJson(e)).toList();

      responseDTO.response = productList;
      return responseDTO;
    } catch (e) {
      return ResponseDTO(false, null, null);
    }
  }
}

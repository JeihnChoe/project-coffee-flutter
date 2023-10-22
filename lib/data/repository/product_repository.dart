import 'package:dio/dio.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/product.dart';

class ProductRepository {
  Dio dio = Dio();
  //
  // Future<void> fetchProductDetail() {
  //   return Future.delayed(Duration(seconds: 3), () => product);
  // }

  Future<ResponseDTO> fetchProductList() async {
    final response = await dio.get("/products");

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    List<dynamic> mapProductList = responseDTO.response as List<dynamic>;
    List<Product> productList =
        mapProductList.map((e) => Product.fromJson(e)).toList();

    responseDTO.response = productList;
    return responseDTO;
  }
}

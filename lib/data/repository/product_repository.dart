import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/mock/product.dart';

class ProductRepository {
  Future<ResponseDTO> fetchProductDetail() {
    return Future.delayed(Duration(seconds: 3), () => mProductResponseDTO);
  }

  Future<ResponseDTO> fetchProductList() {
    return Future.delayed(Duration(seconds: 3), () => mProductListResponseDTO);
  }
}

// import 'package:dio/dio.dart';
// import 'package:project_coffee/data/dto/reponse_dto.dart';
// import 'package:project_coffee/data/model/user.dart';
//
// import '../../_core/constants/http.dart';
//
// class ProductRepository {
//   Future<ResponseDTO> fetchProductDetail(int id) async {
//     try {
//       // Logger().d("레파지토리 : 통신요청");
//       Response response = await dio.get("/products/${id}");
//
//       ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
//       responseDTO.response = Product.fromJson(responseDTO.response);
//       return responseDTO;
//
//       // ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
//       // Product product = responseDTO.response as Product;
//       // responseDTO.response = product;
//     } catch (e) {
//       return ResponseDTO(false, null, null);
//     }
//   }
//
//   Future<ResponseDTO> fetchProductList() async {
//     try {
//       // Logger().d("레파지토리 : 통신시도함?");
//       final response = await dio.get("/products");
//       // Logger().d("레파지토리 : response 받음? ${response.data}");
//       ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
//       List<dynamic> mapProductList = responseDTO.response as List<dynamic>;
//       List<Product> productList =
//           mapProductList.map((e) => Product.fromJson(e)).toList();
//       // Logger().d("레파지토리 : 통신성공함?");
//       responseDTO.response = productList;
//       return responseDTO; //responseDTO 를
//     } catch (e) {
//       // Logger().d("레파지토리 : 통신실패함");
//       return ResponseDTO(false, null, null);
//     }
//   }
// }

import 'package:dio/dio.dart';

import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/http.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/mock/category.dart';
import 'package:project_coffee/data/mock/product.dart';

import '../model/category.dart';

class ProductRepository {
  Future<ResponseDTO> fetchProductDetail() {
    return Future.delayed(Duration(seconds: 3), () => mProductOrderResponseDTO);
  }

  Future<List<ProductListResDTO>> fetchProductDetailList(Category category) async{
    try {
      Logger().d("이제 들어와라 한번쯤은");
      Response<dynamic> response = await dio.get(
          "/api/category/${category.id}/productList");
      Logger().d("이제 들어와라 한번쯤은${response.data}");
      if (response.data != null && response.data is List) {
        // List<dynamic> mapList = response.data as List<dynsmic>;
        List<dynamic> mapList = response.data;
        List<ProductListResDTO> productList = mapList.map((e) =>
            ProductListResDTO.fromJson(e)).toList();
        return productList;
      } else {
        throw Exception("이게 터지네");
      }
    }catch (e) {
      throw Exception(e);
    }
  }

  Future<ResponseDTO> fetchProductDetailList2(Category category) async{
    try{
      Logger().d("카테고리 들고오냐!!!!!!!!!!!!!!!${category.id}");
      Response<dynamic> response = await dio.get("/api/category/${category.id}");
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      List<dynamic> mapList = responseDTO.response as List<dynamic>;
      Logger().d(mapList.toList());
      List<ProductListResDTO> productListResDTOList = mapList.map((e) => ProductListResDTO.fromJson(e)).toList();
      // responseDTO.response = ProductListResDTO.fromJson(responseDTO.response);
      responseDTO.response = productListResDTOList;

      return responseDTO;
    }catch(e){
      Logger().d("너 여기올꺼잖아!!!!!!!!!!!!!!!!!!!!!!!!!!!!${category.id}");
      return Future.delayed(Duration(seconds: 3), () => mProductListResponseDTO);
    }
  }

  Future<ResponseDTO> fetchCategoryList(){
    return Future.delayed(Duration(seconds: 3),() => mCategoryListResponseDTO);
  }

  Future<ResponseDTO> fetchProductCartSave(
      ProductOrderReqDTO productOrderReqDTO) async {
    try {
      // dynamic -> http body
      Response<dynamic> response =
          await dio.post("/api/carts/addCartList", data: productOrderReqDTO.toJson());
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      //  responseDTO.response = User.fromJson(responseDTO.response);
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(false, "잘못된 방법입니다.", null);
    }
    return Future.delayed(
        Duration(seconds: 3), () => mProductOrderResponseDTO);
  }

  Future<ResponseDTO> fetchProductOrderSave(ProductOrderReqDTO productOrderReqDTO) async{
    try {
      Response<dynamic> response = await dio.post("/api/아직 안넣음",data: productOrderReqDTO);
      if(response.data != null && response.data){
        ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
        return responseDTO;
      }
      throw Exception("값이 안들어왔는데");
    } on Exception catch (e) {
      throw Exception("터졌데");
    }
  }
  Future<List<ProductOrderReqDTO>> fetchProductOrderList() async {
    try {
      Response<dynamic> response = await dio.get("api/뭐가 들어 올까요? 아직 백에서 안 만듦");
      Logger().d("쇼핑카드야 ${response.data}");

      if (response.data != null && response.data is List) {
        List<dynamic> bodyList = response.data as List<dynamic>;
        List<ProductOrderReqDTO> productOrderList = bodyList
            .map((e) => ProductOrderReqDTO.fromJson(e)) // Promotion 모델에 따라 변환
            .toList();
        //Logger().d("통신?할게요");
        return productOrderList;
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

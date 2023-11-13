import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/http.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
<<<<<<< HEAD
import 'package:project_coffee/data/mock/category.dart';
=======
>>>>>>> d35f399b28dc11dc9d2c9157a79efe5e0d3553eb

import '../model/category.dart';

class ProductRepository {
  Future<ResponseDTO> fetchProductDetail(
<<<<<<< HEAD
      ProductListResDTO productListResDTO) async {
    try {
      Response response = await dio
          .get("/api/product/${productListResDTO.productId}/viewdetail/");
      Logger().d("이거 널나오면 안된다");
      Logger().d(response.data);
=======
    ProductListResDTO productListResDTO,
  ) async {
    try {
      Response response = await dio
          .get("/api/product/${productListResDTO.productId}/viewdetail/");

      Logger().d("API 응답 데이터: ${response.data}");

>>>>>>> d35f399b28dc11dc9d2c9157a79efe5e0d3553eb
      if (response.data != null) {
        ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

        // List일 경우 첫 번째 요소를 가져옴
<<<<<<< HEAD
        if (responseDTO.response.isNotEmpty) {
          Logger().d(
              "dddddddddddddddddddddd 샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라");
          Logger().d(responseDTO.response.first);
          ProductDetailResDTO productDetail =
              ProductDetailResDTO.fromJson(responseDTO.response.first);
          Logger().d("이거이거");
          Logger().d(productDetail);
=======
        Logger().d("이거 가져와줘어이이잉");
        Logger().d(responseDTO.response.first);
        Logger().d(responseDTO.response[0].description);
        if (responseDTO.response is List<dynamic> &&
            responseDTO.response.isNotEmpty) {
          ProductDetailResDTO productDetail =
              ProductDetailResDTO.fromJson1(responseDTO.response.first);

          Logger().d("상품 세부 정보: ${productDetail}");
>>>>>>> d35f399b28dc11dc9d2c9157a79efe5e0d3553eb

          responseDTO.response = productDetail;
          return responseDTO;
        } else {
          throw Exception("API 응답 형식이 예상과 다릅니다.");
        }
      } else {
        throw Exception("API 응답이 null입니다.");
      }
    } catch (e) {
      throw Exception("API 요청 중 오류 발생: ${e}");
    }
  }

  Future<ResponseDTO> fetchProductDetailList(Category category) async {
    try {
<<<<<<< HEAD
      Response<dynamic> response =
          await dio.get("/api/product/${category.id}/productlist");
=======
      Logger().d("이제 들어와라 한번쯤은");
      Response<dynamic> response =
          await dio.get("/api/product/${category.id}/productlist");
      Logger().d("이제 들어와라 한번쯤은 ${response.data}");
      Logger().d(response.data);
>>>>>>> d35f399b28dc11dc9d2c9157a79efe5e0d3553eb

      if (response.data != null) {
        ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
        List<dynamic> mapList = responseDTO.response;

        List<ProductListResDTO> productList =
            mapList.map((e) => ProductListResDTO.fromJson(e)).toList();
        responseDTO.response = productList;
        return responseDTO;
      } else {
        throw Exception("이게 터지네");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
<<<<<<< HEAD

  Future<ResponseDTO> fetchCategoryList() {
    return Future.delayed(Duration(seconds: 3), () => mCategoryListResponseDTO);
  }
=======
>>>>>>> d35f399b28dc11dc9d2c9157a79efe5e0d3553eb

  Future<ResponseDTO> fetchProductCartSave(
      String jwt, ProductOrderReqDTO productOrderReqDTO) async {
    Logger().d("값은 넘어와 ?");
    Logger().d(productOrderReqDTO.toJson());
    Logger().d(jwt);
    try {
      // dynamic -> http body
<<<<<<< HEAD
      Response<dynamic> response = await dio.post("/api/carts/addCartList",
          data: productOrderReqDTO.toJson());
=======
      Response response = await dio.post("/api/cart/addcartlist",
          data: productOrderReqDTO.toJson(),
          options: Options(headers: {"Authorization": "${jwt}"}));
      Logger().d("통신은 된다냐??!!");
      Logger().d(response.data);
>>>>>>> d35f399b28dc11dc9d2c9157a79efe5e0d3553eb
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      //  responseDTO.response = User.fromJson(responseDTO.response);
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(false, "잘못된 방법입니다.", null);
    }
  }

  Future<ResponseDTO> fetchProductOrderSave(
      ProductOrderReqDTO productOrderReqDTO) async {
    try {
      Response<dynamic> response =
          await dio.post("/api/아직 안넣음", data: productOrderReqDTO);
      if (response.data != null && response.data) {
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

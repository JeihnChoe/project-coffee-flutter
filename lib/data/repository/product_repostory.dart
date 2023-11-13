import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/http.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';

import '../model/category.dart';

class ProductRepository {
  Future<ResponseDTO> fetchProductDetail(
    ProductListResDTO productListResDTO,
  ) async {
    try {
      Response response = await dio
          .get("/api/product/${productListResDTO.productId}/viewdetail/");

      Logger().d("API 응답 데이터: ${response.data}");

      if (response.data != null) {
        ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

        // List일 경우 첫 번째 요소를 가져옴


        if (responseDTO.response.isNotEmpty) {
          Logger().d(
              "dddddddddddddddddddddd 샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라샤랄라");
          Logger().d(responseDTO.response.first);
          ProductDetailResDTO productDetail =
              ProductDetailResDTO.fromJson(responseDTO.response.first);
          Logger().d("이거이거");
          Logger().d(productDetail);

          Logger().d("상품 세부 정보: ${productDetail}");

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
      Logger().d("이제 들어와라 한번쯤은");
      Response<dynamic> response =
          await dio.get("/api/product/${category.id}/productlist");
      Logger().d("이제 들어와라 한번쯤은 ${response.data}");
      Logger().d(response.data);

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

  Future<ResponseDTO> fetchProductCartSave(
      String jwt, ProductOrderReqDTO productOrderReqDTO) async {
    Options options = Options(headers: {
      "Authorization": "Bearer ${jwt}",
    });
    Logger().d("값은 넘어와 ?");
    Logger().d(productOrderReqDTO.toJson());
    List<Map<String, dynamic>> modifiedData = [productOrderReqDTO.toJson()];
    Logger().d("리스트로 바꿧자나 제발");
    Logger().d(modifiedData);
    Logger().d(jwt);

    try {
      // dynamic -> http body

      Response response = await dio.post("/api/cart/addcartlist",
<<<<<<< HEAD
          data: productOrderReqDTO.toJson(),
          options: Options(headers: {"Authorization": "${jwt}"}));
=======
          data: modifiedData, options: options);
      Logger().d("통신은 된다냐??!!");
      Logger().d(response.data);

>>>>>>> 8d0ec0ea9e489512c672693c77f2e3fc6dfa70a1
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      //  responseDTO.response = User.fromJson(responseDTO.response);
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      Logger().d(e);
      return ResponseDTO(false, "잘못된 방법입니다.", null);
    }
  }

  Future<ResponseDTO> fetchProductOrderList(String jwt) async {
    try {
      Response<dynamic> response = await dio.get("/api/cart/viewcartlist",
          options: Options(headers: {"Authorization": "${jwt}"}));

      if (response.data != null) {
        ResponseDTO responseDTO =
            ResponseDTO.fromJson(response.data); // 여기에 주어진 JSON 문자열을 넣으세요.
        OrderResponse orderResponseDTO =
            OrderResponse.fromJson(responseDTO.response);

        List<CartTotalDTO> cartTotalList = [];

        for (ProductDTO product in orderResponseDTO.productList) {
          for (CartItemDTO cartItem in product.carts) {
            CartTotalDTO cartTotalDTO = CartTotalDTO(
              totalPrice: orderResponseDTO.totalPrice,
              name: product.name,
              engName: product.engName,
              picUrl: product.picUrl,
              isIced: product.isIced,
              cupType: cartItem.cupType,
              quantity: cartItem.quantity,
              price: cartItem.price,
              size: cartItem.size,
              sumPrice: cartItem.sumPrice,
            );

            cartTotalList.add(cartTotalDTO);
            // Logger().d(cartTotalDTO); // 이 부분에서 cartTotalDTO를 사용
          }
        }

        responseDTO.response = cartTotalList;
        return responseDTO;
      } else {
        // 서버 응답이 Promotion 목록이 아닌 경우 처리
        throw Exception("Invalid server response format");
      }
    } catch (e) {
      // 오류 처리를 수행할 수 있습니다.
      throw Exception("뭐가 틀렸냐 하면은${e}");
    }
  }
}

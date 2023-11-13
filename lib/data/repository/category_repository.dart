import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/http.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/mock/category.dart';

import '../model/category.dart';

class CategoryRepository {
  Future<ResponseDTO> fetchCategoryDetail() {
    return Future.delayed(Duration(seconds: 3), () => mCategoryResponseDTO);
  }

  Future<List<Category>> fetchCategoryDetailList() async {
    try {
      Response<dynamic> response = await dio.get("/api/category/viewlist");
      Logger().d(response);
      if (response.data != null) {
        // ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
        List<dynamic> mapList = response.data;
        List<Category> categoryList = mapList
            .map((e) => Category.fromJson(e)) // Promotion 모델에 따라 변환
            .toList();
        // responseDTO.response = categoryList;
        return categoryList;
      }else {
        throw Exception("여기 아닌데");
      }
    } catch (e) {
      Logger().d("요기 왜 요기로 오냐 ??? 통신 됬잖아${e}");
      throw Exception(e);
    }
  }
}

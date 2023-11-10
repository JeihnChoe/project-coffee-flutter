

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

  Future<ResponseDTO> fetchCategoryDetailList() async {
    try {
      Logger().d("들어오냐 ?");
      Response<dynamic> response = await dio.get("/api/category/");

      if (response.data != null) {
        ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
        if (responseDTO.success == true) {
          Logger().d("픽미오냐?${responseDTO.response}");
          List<dynamic> mapList = responseDTO.response;
          Logger().d(mapList?.toList() ?? []);
          List<CategoryReqDTO> categoryList = mapList.map((e) => CategoryReqDTO.fromJson(e)).toList();
          responseDTO.response = categoryList;
        }
        return responseDTO;
      } else {
        Logger().d("요기");
        return ResponseDTO(false, null, "실패: response.data is null");
      }
    } catch (e) {
      Logger().d("요기");
      return ResponseDTO(false, null, "실패 : ${e}");
      // return Future.delayed(Duration(seconds: 3), () => mCategoryListResponseDTO);
    }
  }




}


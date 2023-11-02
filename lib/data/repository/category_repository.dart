import 'package:logger/logger.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/mock/category.dart';

class CategoryRepository {
  Future<ResponseDTO> fetchCategoryDetail() {
    return Future.delayed(Duration(seconds: 3), () => mCategoryResponseDTO);
  }

  Future<ResponseDTO> fetchCategoryDetailList() {
    return Future.delayed(Duration(seconds: 3), () => mCategoryListResponseDTO);
  }

}


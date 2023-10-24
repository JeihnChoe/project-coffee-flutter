import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/mock/user.dart';

class UserRepository {
  Future<ResponseDTO> fetchProductDetail() {
    return Future.delayed(Duration(seconds: 3), () => mUserResponseDTO);
  }

  Future<ResponseDTO> fetchProductList() {
    return Future.delayed(Duration(seconds: 3), () => mUserListResponseDTO);
  }
}

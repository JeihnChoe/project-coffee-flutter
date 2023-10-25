import 'package:dio/dio.dart';
import 'package:project_coffee/_core/constants/http.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/data/mock/user.dart';

class UserRepository {
  Future<ResponseDTO> fetchJoin(JoinReqDTO joinReqDTO) async{
    try {
    // dynamic -> http body
    Response<dynamic> response = await dio.post("/join", data: joinReqDTO.toJson());
    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
    //responseDTO.data = User.fromJson(responseDTO.data);

    return responseDTO;
    } catch (e) {
    // 200이 아니면 catch로 감
    return ResponseDTO(false, "중복되는 유저명입니다", null);
    }
    return Future.delayed(Duration(seconds: 3), () => mUserResponseDTO);
  }

  Future<ResponseDTO> fetchLogin() {
    return Future.delayed(Duration(seconds: 3), () => mUserListResponseDTO);
  }
}

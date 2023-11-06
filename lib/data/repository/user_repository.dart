import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/http.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/dto/user_request.dart';
import 'package:project_coffee/data/mock/user.dart';
import 'package:project_coffee/data/model/user.dart';

class UserRepository {
  Future<ResponseDTO> fetchJoin(JoinReqDTO joinReqDTO) async {
    try {

      // dynamic -> http body

      Response<dynamic> response =
      await dio.post("/api/join", data: joinReqDTO.toJson());

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      // responseDTO.response = User.fromJson(responseDTO.response);

      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(false, "중복되는 유저명입니다", null);
    }
  }




  Future<ResponseDTO> fetchLogin(LoginReqDTO requestDTO) async {
    try{
      // 1. 통신 시작
      Response response = await dio.post("/api/login", data: requestDTO.toJson());

      // 2. DTO 파싱
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      responseDTO.response = User.fromJson(responseDTO.response);

      // 3. 토큰 받기
      final authorization = response.headers["authorization"];
      if(authorization != null){
        // responseDTO.token = authorization.first;
      }
      return responseDTO;
    }catch(e){
      return ResponseDTO(false, null,"아이디 혹은 비번이 틀렸습니다");
    }
  }
}

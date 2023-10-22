class ResponseDTO {
  final bool success; // 서버에서 요청 성공 여부를 응답할 때 사용되는 변수
  dynamic response; // 서버에서 응답 시 보내는 메시지를 담아두는 변수
  String? token; // 헤더로 던진 토큰 값을 담아두는 변수
  final String error; // 서버에서 응답한 데이터를 담아두는 변수

  ResponseDTO(this.success, this.response, this.token, this.error);

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : success = json["success"],
        error = json["error"],
        response = json["response"];
}

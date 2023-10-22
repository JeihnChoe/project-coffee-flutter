class ResponseDTO {
  final bool success;
  dynamic response;
  dynamic error; // 서버에서 응답한 데이터를 담아두는 변수

  ResponseDTO(this.success, this.response, this.error);

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : success = json["success"],
        response = json["response"],
        error = json["error"];
}

class ResponseDTO {
  final bool success;
  dynamic response;
  dynamic error;

  ResponseDTO(this.success, this.response, this.error);

  ResponseDTO.fromJson(Map<String, dynamic> json)
      : success = json["success"],
        response = json["response"],
        error = json["error"];
}

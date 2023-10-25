class JoinReqDTO {
  final String userId;
  final String password;
  final String email;
  final String phonenumber;
  JoinReqDTO(
      {required this.userId,
      required this.password,
      required this.email,
      required this.phonenumber});

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "password": password,
        "email": email,
        "phonenumber": phonenumber
      };
}

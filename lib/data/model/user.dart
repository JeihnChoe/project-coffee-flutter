class User {
  int? id;
  final String loginId;
  final String email; // 인증시 필요한 필드
  final String userName;
  final String password;
  final String phoneNumber;
  int? manager; // 1 : 유저 / 2 : 관리자
  String? createdAt; // 가입일시
  String? updatedAt;

  User(
      { required this.loginId, required this.password,required this.email,required this.phoneNumber,required this.userName});

  User.fromJson(Map<String, dynamic> json)
      :
        loginId = json["loginId"],
        password = json["password"],
        email = json["email"],
        phoneNumber = json["phoneNumber"],
        userName = json["userName"];

        Map<String, dynamic> toJson()=>{
    "loginId": loginId,
    "password": password,
    "email": email,
    "phoneNumber": phoneNumber,
    "userName": userName,
  };
}

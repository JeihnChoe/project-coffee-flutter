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

class LoginReqDTO {
  final String userId;
  final String password;

  LoginReqDTO({
    required this.userId,
    required this.password
  });

  Map<String, dynamic> toJson() => {
    "username": userId,
    "password": password
  };
}

class FindLoginIdReqDTO{
  final String email;
  FindLoginIdReqDTO({
    required this.email
});
  Map<String, dynamic> toJson() => {
    "email" : email
  };
}

class FindPasswordReqDTO{
  final String email;
  FindPasswordReqDTO({
    required this.email,

});
  Map<String, dynamic> toJson() => {
    "email" : email,
  };

}
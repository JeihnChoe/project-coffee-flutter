class JoinReqDTO {
  final String loginId;
  final String password;
  final String email;
  final String userName;
  // final String passwordChk;
  final String phoneNumber;
  JoinReqDTO(
      {required this.loginId,
        required this.password,
        required this.email,
        required this.userName,
        required this.phoneNumber,
        // required this.passwordChk
      });

  Map<String, dynamic> toJson() => {
    "loginId": loginId,
    "password": password,
    "email": email,
    "userName" : userName,
    "phoneNumber": phoneNumber,
    // "passwordChk" : passwordChk,
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
class FindPasswordNewSetReqDTO{
  final String password;
  final String passwordchk;
  FindPasswordNewSetReqDTO({required this.password,required this.passwordchk});

  Map<String , dynamic> toJson() =>{
    "password" : password,
    "passwordchk" : passwordchk,
  };
}
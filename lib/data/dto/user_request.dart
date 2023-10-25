class JoinReqDTO{
  final String userId;
  final String password;
  final String email;
  JoinReqDTO({required this.userId,required this.password,required this.email});

  Map<String, dynamic> toJson() =>{
    "userId" : userId,"password" : password, "email" : email
  };
}
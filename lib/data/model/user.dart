class User {
  final int id;
  final String email; // 인증시 필요한 필드
  final String username;
  final String phonenumber;
  final int? manager; // 1 : 유저 / 2 : 관리자
  final String createdAt; // 가입일시
  final String updatedAt;

  User(this.id, this.email, this.username, this.phonenumber, this.manager,
      this.createdAt, this.updatedAt);
}

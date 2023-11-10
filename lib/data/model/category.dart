class Category {
  final int id;
  final String name;
  final String engName;
  final int code; // 0 : 음료 , 1 : 푸드
  final String picUrl;

  Category(this.id, this.name, this.engName, this.code,
      this.picUrl);

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "name": name,
        "engName": engName,
        "code": code,
        "picUrl": picUrl
      };
  Category.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        engName = json["engName"],
        code = json["code"],
        picUrl = json["picUrl"];
}
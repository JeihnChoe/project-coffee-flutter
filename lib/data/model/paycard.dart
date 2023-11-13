class PayCard {
  final int id;
  final String? picUrl;
  final String name;
  final int money;
  final int? userId;
  int? number;
  int? pinNumber;
  String? createdAt;

  PayCard(this.id, this.picUrl, this.name, this.money, this.userId, this.number,
      this.pinNumber, this.createdAt);

  PayCard.fromjson(Map<String, dynamic> json)
      : id = json["id"],
        picUrl = json["picUrl"],
        name = json["name"],
        money = json["money"],
        userId = json["userId"],
        number = json["number"],
        pinNumber = json["pinNumber"],
        createdAt = json["createdAt"];
}

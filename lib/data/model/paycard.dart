class PayCard {
  final int id;
  final String cardPicUrl;
  final String cardName;
  final int cardMoney;
  final int cardNumber;
  final int pinNumber;
  final String cardCreatedAt;

  PayCard(this.id, this.cardPicUrl, this.cardName, this.cardMoney,
      this.cardNumber, this.pinNumber, this.cardCreatedAt);

  PayCard.fromjson(Map<String, dynamic> json)
      : id = json["id"],
        cardPicUrl = json["cardPicUrl"],
        cardName = json["cardName"],
        cardMoney = json["cardMoney"],
        cardNumber = json["cardNumber"],
        pinNumber = json["pinNumber"],
        cardCreatedAt = json["cardCreatedAt"];
}

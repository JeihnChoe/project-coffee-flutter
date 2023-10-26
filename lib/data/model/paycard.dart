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
}

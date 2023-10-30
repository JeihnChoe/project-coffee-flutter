import 'dart:ui';

class CardSaveReqDTO {
  final String cardName;
  final String cardNumber;
  final String pinNumber;

  CardSaveReqDTO({
    required this.cardName,
    required this.cardNumber,
    required this.pinNumber,
  });

  Map<String, dynamic> toJson() => {
        "cardName": cardName,
        "cardNumber": cardNumber,
        "pinNumber": pinNumber,
      };
}

class CardChargeReqDTO {
  final int cardId;
  final String cardPicUrl;
  final String cardName;
  final String cardNumber;
  final String cardMoney;
  final String pinNumber;
  final String chargeMoney;
  final String totalMoney;

  CardChargeReqDTO({
    required this.cardId,
    required this.cardPicUrl,
    required this.cardName,
    required this.cardNumber,
    required this.cardMoney,
    required this.pinNumber,
    required this.chargeMoney,
    required this.totalMoney,
});
  Map<String , dynamic> toJson() => {
    "cardId" : cardId,
    "cardName": cardName,
    "cardNumber": cardNumber,
    "cardMoney": cardMoney,
    "pinNumber": pinNumber,
    "chargeMoney": chargeMoney,
    "totalMoney": totalMoney,
  };
}

class CardSaveReqDTO{
  final String cardName;
  final String cardNumber;
  final String pinNumber;
  CardSaveReqDTO(
      {required this.cardName,
        required this.cardNumber,
        required this.pinNumber,
        });

  Map<String, dynamic> toJson() => {
    "cardName": cardName,
    "cardNumber": cardNumber,
    "pinNumber": pinNumber,
  };
}
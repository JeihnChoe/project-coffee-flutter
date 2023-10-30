import 'package:project_coffee/data/dto/reponse_dto.dart';

import '../model/paycard.dart';

ResponseDTO mCardResponseDTO = ResponseDTO(true, _mCard, null);
ResponseDTO mCardListResponseDTO = ResponseDTO(true, _mCardList, null);
// id; cardPicUrl; cardName; cardMoney; cardNumber; pinNumber; cardCreatedAt;
PayCard _mCard = PayCard(
    1,
    "https://image.istarbucks.co.kr/cardImg/20230519/010289_WEB.png",
    "애니버서리 사이렌카드",
    50000,
    12345678,
    1234,
    "2023-10-24 14:20:36.077");

List<PayCard> _mCardList = [
  PayCard(1, "https://image.istarbucks.co.kr/cardImg/20230519/010289_WEB.png",
      "애니버서리 사이렌카드", 50000, 12345678, 1234, "2023-10-24 14:20:36.077"),
  PayCard(2, "https://image.istarbucks.co.kr/cardImg/20230519/010288_WEB.png",
      "사이렌 헤리티지 카드", 30000, 12312678, 1444, "2023-10-24 14:20:36.077"),
  PayCard(3, "https://image.istarbucks.co.kr/cardImg/20230519/010286_WEB.png",
      "블랙핑크 스타벅스 카드", 40000, 12312678, 1444, "2023-10-24 14:20:36.077"),
  PayCard(4, "https://image.istarbucks.co.kr/cardImg/20230320/010146_WEB.png",
      "서머 샤인 카드", 0, 12312678, 1444, "2023-10-24 14:20:36.077"),
  PayCard(5, "https://image.istarbucks.co.kr/cardImg/20230316/010126_WEB.png",
      "서머 베케이션 카드", 20000, 12312678, 1444, "2023-10-24 14:20:36.077"),
  PayCard(6, "https://image.istarbucks.co.kr/cardImg/20230315/010107_WEB.png",
      "고맙습니다 카드", 30000, 12312678, 1444, "2023-10-24 14:20:36.077"),
  PayCard(7, "https://image.istarbucks.co.kr/cardImg/20230315/010106_WEB.png",
      "서머사파리 카드", 30000, 12312678, 1444, "2023-10-24 14:20:36.077"),
  PayCard(8, "https://image.istarbucks.co.kr/cardImg/20230216/010086_WEB.png",
      "스프링가든 카드", 30000, 12312678, 1444, "2023-10-24 14:20:36.077"),
  PayCard(9, "https://image.istarbucks.co.kr/cardImg/20230216/010066_WEB.png",
      "스타벅스 LOVE 카드", 30000, 12312678, 1444, "2023-10-24 14:20:36.077"),
  PayCard(10, "https://image.istarbucks.co.kr/cardImg/20221114/009646_WEB.png",
      "스타먹스 Thank You 카드", 30000, 12312678, 1444, "2023-10-24 14:20:36.077"),
];

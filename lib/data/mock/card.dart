import 'package:project_coffee/data/dto/reponse_dto.dart';

import '../model/card.dart';

ResponseDTO mCardResponseDTO = ResponseDTO(true, _mCard, null);
ResponseDTO mCardListResponseDTO = ResponseDTO(true, _mCardList, null);
// id; cardPicUrl; cardName; cardMoney; cardNumber; pinNumber; cardCreatedAt;
Card _mCard = Card(
    1,
    "https://image.istarbucks.co.kr/cardImg/20230519/010289_WEB.png",
    "애니버서리 사이렌카드",
    50000,
    12345678,
    1234,
    "2023-10-24 14:20:36.077");

List<Card> _mCardList = [
  Card(1, "https://image.istarbucks.co.kr/cardImg/20230519/010289_WEB.png",
      "애니버서리 사이렌카드", 50000, 12345678, 1234, "2023-10-24 14:20:36.077"),
  Card(
      2,
      "사이렌 헤리티지 카드",
      "https://image.istarbucks.co.kr/cardImg/20230519/010288_WEB.png",
      30000,
      12312678,
      1444,
      "2023-10-24 14:20:36.077"),
  Card(
      3,
      "블랙핑크 스타벅스 카드",
      "https://image.istarbucks.co.kr/cardImg/20230519/010286_WEB.png",
      30000,
      12312678,
      1444,
      "2023-10-24 14:20:36.077"),
  Card(
      4,
      "서머 샤인 카드",
      "https://image.istarbucks.co.kr/cardImg/20230320/010146_WEB.png",
      30000,
      12312678,
      1444,
      "2023-10-24 14:20:36.077"),
  Card(
      5,
      "서머 베케이션 카드",
      "https://image.istarbucks.co.kr/cardImg/20230316/010126_WEB.png",
      30000,
      12312678,
      1444,
      "2023-10-24 14:20:36.077"),
  Card(
      6,
      "고맙습니다 카드",
      "https://image.istarbucks.co.kr/cardImg/20230315/010107_WEB.png",
      30000,
      12312678,
      1444,
      "2023-10-24 14:20:36.077"),
  Card(
      7,
      "서머사파리 카드",
      "https://image.istarbucks.co.kr/cardImg/20230315/010106_WEB.png",
      30000,
      12312678,
      1444,
      "2023-10-24 14:20:36.077"),
  Card(
      8,
      "스프링가든 카드",
      "https://image.istarbucks.co.kr/cardImg/20230216/010086_WEB.png",
      30000,
      12312678,
      1444,
      "2023-10-24 14:20:36.077"),
  Card(
      9,
      "스타벅스 LOVE 카드",
      "https://image.istarbucks.co.kr/cardImg/20230216/010066_WEB.png",
      30000,
      12312678,
      1444,
      "2023-10-24 14:20:36.077"),
  Card(
      10,
      "스타먹스 Thank You 카드",
      "https://image.istarbucks.co.kr/cardImg/20221114/009646_WEB.png",
      30000,
      12312678,
      1444,
      "2023-10-24 14:20:36.077"),
];

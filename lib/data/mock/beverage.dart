import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/beverage.dart';

ResponseDTO mCategoryResponseDTO = ResponseDTO(true, _mBeverage, null);
ResponseDTO mCategoryListResponseDTO = ResponseDTO(true, _mBeverageList, null);

Beverage _mBeverage = Beverage(
    1,
    "나이트로바닐라크림",
    "Nitro Vanilla Cream",
    "부드러운 목넘김의 나이트로 커피와 바닐라 크림의 매력을 한번에 느껴보세요!",
    "디카페인결제시 300원 추가됩니다.",
    "hot",
    "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000002487]_20210426091745609.jpg",
    1);

List<Beverage> _mBeverageList = [
  Beverage(
      1,
      "나이트로바닐라크림",
      "Nitro Vanilla Cream",
      "부드러운 목넘김의 나이트로 커피와 바닐라 크림의 매력을 한번에 느껴보세요!",
      "디카페인결제시 300원 추가됩니다.",
      "Hot",
      "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000002487]_20210426091745609.jpg",
      1),
  Beverage(
      2,
      "바닐라 크림 콜드 브루",
      "Vanilla Cream Cold Brew",
      "콜드 브루에 더해진 바닐라 크림으로 깔끔하면서 달콤한 콜드 브루를 새롭게 즐길 수 있는 음료입니다.",
      "디카페인결제시 300원 추가됩니다.",
      "Iced",
      "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000002487]_20210426091745609.jpg",
      1),
  Beverage(
      3,
      "바닐라 크림 콜드 브루",
      "Vanilla Cream Cold Brew",
      "콜드 브루에 더해진 바닐라 크림으로 깔끔하면서 달콤한 콜드 브루를 새롭게 즐길 수 있는 음료입니다.",
      "디카페인결제시 300원 추가됩니다.",
      "Iced",
      "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000002487]_20210426091745609.jpg",
      1),
  Beverage(
      4,
      "돌체 콜드 브루",
      "Dolche Cold Brew",
      "무더운 여름철 동남아 휴가지에서 즐기는 커피를 떠오르게 하는 스타벅스 음료의 베스트 x 베스트 조합인 돌체 콜드 브루를 만나보세요!",
      "디카페인결제시 300원 추가됩니다.",
      "Iced",
      "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000002487]_20210426091745609.jpg",
      2),
  Beverage(
      5,
      "에스프레소 콘 파나",
      "Espresso Con Panna",
      "신선한 에스프레소 샷에 풍부한 휘핑크림을 얹은 커피 음료로서, 뜨거운 커피의 맛과 차갑고 달콤한 생크림의 맛을 같이 즐길 수 있는 커피 음료",
      "디카페인결제시 300원 추가됩니다.",
      "Iced",
      "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[30]_20210415144252425.jpg",
      3),
  Beverage(
      6,
      "에스프레소 콘 마끼아또",
      "Espresso Macchiato",
      "신선한 에스프레소 샷에 우유 거품을 살짝 얹은 커피 음료로써, 강렬한 에스프레소의 맛과 우유의 부드러움을 같이 즐길 수 있는 커피 음료",
      "디카페인결제시 300원 추가됩니다.",
      "Iced",
      "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[25]_20210415144211211.jpg",
      3),
];
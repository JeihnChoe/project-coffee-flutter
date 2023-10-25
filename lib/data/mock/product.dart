import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/product.dart';

ResponseDTO mProductResponseDTO = ResponseDTO(true, _mProduct, null);
ResponseDTO mProductListResponseDTO = ResponseDTO(true, _mProductList, null);

Product _mProduct = Product(
    1,
    "아이스아메리카노",
    "Iced-Americano",
    1,
    "진한 에스프레소에 시원한 정수물과 얼음을 더하여 스타벅스의 깔끔하고 강렬한 에스프레소를 가장 부드럽고 시원하게 즐길 수 있는 커피",
    "1.jpg",
    4500,
    "Best",
    "칼로리: 2kcal",
    null);

List<Product> _mProductList = [
  Product(1, "아이스아메리카노", "Iced-Americano", 1, "진한 에스프레소에 물이랑 얼음넣었슴다",
      "localhost:8080/images/1.jpg", 4500, "Best", "칼로리: 2kcal", null),
  Product(2, "카페라떼", "Caffe-Latte", 1, "우유타고얼음넣은 에스프레소입니다.", "assets/2.jpg",
      5500, "Best", "칼로리: 200kcal", "우유"),
  Product(3, "돌체라떼", "Dolche-Latte", 1, "우유타고돌체시럽넣고얼음넣은 에스프레소입니다.",
      "assets/3.jpg", 6500, "Best", "칼로리: 250kcal", "우유"),
  Product(4, "바닐라라떼", "Vanila-Latte", 1, "우유타고바닐라시럽넣고얼음넣은 에스프레소입니다.",
      "assets/4.jpg", 6100, "Best", "칼로리: 230kcal", "우유"),
  Product(5, "아포가토", "Apogatto", 1, "에스프레소 아이스크림", "assets/5.jpg", 7200, "Best",
      "칼로리: 320kcal", "우유"),
  Product(6, "아이스아메리카노", "Iced-Americano", 1, "진한 에스프레소에 물이랑 얼음넣었슴다",
      "assets/6.jpg", 4500, "Best", "칼로리: 2kcal", null),
  Product(7, "카페라떼", "Caffe-Latte", 1, "우유타고얼음넣은 에스프레소입니다.", "assets/7.jpg",
      5500, "Best", "칼로리: 200kcal", "우유"),
  Product(8, "돌체라떼", "Dolche-Latte", 1, "우유타고돌체시럽넣고얼음넣은 에스프레소입니다.",
      "assets/8.jpg", 6500, "Best", "칼로리: 250kcal", "우유"),
  Product(9, "바닐라라떼", "Vanila-Latte", 1, "우유타고바닐라시럽넣고얼음넣은 에스프레소입니다.",
      "assets/9.jpg", 6100, "Best", "칼로리: 230kcal", "우유"),
  Product(10, "아포가토", "Apogatto", 1, "에스프레소 아이스크림", "assets/10.jpg", 7200,
      "Best", "칼로리: 320kcal", "우유"),
  Product(11, "돌체라떼", "Dolche-Latte", 1, "우유타고돌체시럽넣고얼음넣은 에스프레소입니다.",
      "assets/11.jpg", 6500, "Best", "칼로리: 250kcal", "우유"),
  Product(12, "바닐라라떼", "Vanila-Latte", 1, "우유타고바닐라시럽넣고얼음넣은 에스프레소입니다.",
      "assets/12.jpg", 6100, "Best", "칼로리: 230kcal", "우유"),
];
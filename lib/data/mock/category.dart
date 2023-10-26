import 'package:project_coffee/data/dto/reponse_dto.dart';

import '../model/category.dart';

ResponseDTO mCategoryResponseDTO = ResponseDTO(true, _mCategory, null);
ResponseDTO mCategoryListResponseDTO = ResponseDTO(true, _mCategoryList, null);

Category _mCategory = Category(1, "커피", "coffee", 1);

List<Category> _mCategoryList = [
  Category(1, "커피", "coffee", 1),
  Category(2, "에스프레소", "coffee", 1),
  Category(3, "리프레셔", "coffee", 1),
  Category(4, "콜드 브루", "coffee", 1),
  Category(5, "블론드", "coffee", 1),
  Category(6, "디카페인", "coffee", 1),
  Category(7, "프라푸치노", "coffee", 1),
  Category(8, "블렌디드", "coffee", 1),
  Category(9, "피지오", "coffee", 1),
  Category(10, "티바나", "coffee", 1),
  Category(11, "기타", "coffee", 1),
  Category(12, "브레드", "", 2),
  Category(13, "케이크&미니디저트", "", 2),
  Category(14, "샌드위치&샐러드", "", 2),
  Category(15, "따뜻한푸드", "", 2),
  Category(16, "과일&요거트", "", 2),
  Category(17, "스낵", "", 2),
  Category(18, "아이스크림", "", 2)
];

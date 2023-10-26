import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/category.dart';

ResponseDTO mCategoryResponseDTO = ResponseDTO(true, _mCategory, null);
ResponseDTO mCategoryListResponseDTO = ResponseDTO(true, _mCategoryList, null);

Category _mCategory = Category(1, "커피", "coffee", 1,
    "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000000038]_20210430113202458.jpg");

List<Category> _mCategoryList = [
  Category(1, "콜드 브루 커피", "coffee", 1,
      "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000000038]_20210430113202458.jpg"),
  Category(2, "브루드 커피", "Espresso", 1,
      "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[2]_20210430111934117.jpg"),
  Category(3, "에스프레소", "Refresher", 1,
      "https://image.istarbucks.co.kr/upload/store/skuimg/2023/07/[9200000004753]_20230720103623021.jpg"),
  Category(4, "프라푸치노", "Frappuccino", 1,
      "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[168016]_20210415154152122.jpg"),
  Category(5, "블렌디드", "Blended", 1,
      "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000002953]_20210427132718157.jpg"),
  Category(6, "스타벅스 리프레셔", "Starbucks Refresher", 1,
      "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[106509]_20210430111852870.jpg"),
  Category(7, "스타벅스 피지오", "Starbucks Fizzio", 1,
      "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000002950]_20210426150654756.jpg"),
  Category(8, "디카페인", "DeCaffeine", 1,
      "https://image.istarbucks.co.kr//upload/store/skuimg/2017/09/[11059722]_20170921153534420.jpg"),
  Category(9, "티(티바나)", "Teavana", 1,
      "https://image.istarbucks.co.kr/upload/store/skuimg/2023/09/[9200000004933]_20230914141717984.jpg"),
  Category(10, "병음료", "Others", 1,
      "https://image.istarbucks.co.kr/upload/store/skuimg/2022/09/[9300000004348]_20220921102420365.jpg"),
  Category(11, "브레드", "Bread", 2, ""),
  Category(12, "케이크&미니디저트", "Cake&MiniDessert", 2, ""),
  Category(13, "샌드위치&샐러드", "Sandwich&Salad", 2, ""),
  Category(14, "따뜻한푸드", "Hot food", 2, ""),
  Category(15, "과일&요거트", "Fruit&Yogurt", 2, ""),
  Category(16, "스낵", "Snack", 2, ""),
  Category(17, "아이스크림", "Ice Cream", 2, "")
];

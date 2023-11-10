import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/category.dart';

ResponseDTO mCategoryResponseDTO = ResponseDTO(true, _mCategory, null);
ResponseDTO mCategoryListResponseDTO = ResponseDTO(true, _mCategoryList, null);

Category _mCategory = Category(1, "커피", "coffee", 1,
    "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000000038]_20210430113202458.jpg");
List<Category> _mCategoryList = [
  Category (1, "콜드브루", "coldbrew", 1, "https://image.istarbucks.co.kr/upload/store/skuimg/2023/07/[9200000003661]_20230721170207026.jpg"),
  Category (2, "브루드커피", "brewed", 1, "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[106509]_20210430111852870.jpg"),
  Category (3, "에스프레소", "espresso", 1, "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[20]_20210415144112678.jpg"),
  Category (4, "프라푸치노", "frappuccino", 1, "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[168016]_20210415154152122.jpg"),
  Category (5, "블렌디드", "blended", 1, "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[169001]_20210419130701792.jpg"),
  Category (6, "리프레셔", "refresher", 1, "https://image.istarbucks.co.kr/upload/store/skuimg/2022/08/[9200000003763]_20220803131322551.jpg"),
  Category (7, "피지오", "fizzio", 1, "https://image.istarbucks.co.kr/upload/store/skuimg/2023/09/[9200000004751]_20230907153225204.jpg"),
  Category (8, "디카페인", "decaffeine", 1, "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[110563]_20210426095937808.jpg"),
  Category (9, "티(티바나)", "tea", 1, "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[4004000000036]_20210415143933425.jpg"),
  Category (10, "병음료", "others", 1, "https://image.istarbucks.co.kr/upload/store/skuimg/2023/03/[5210008055]_20230331142558998.jpg"),
  Category (11, "브레드", "id", 2, "https://image.istarbucks.co.kr/upload/store/skuimg/2023/10/[9300000004824]_20231004111431349.jpg"),
  Category (12, "케이크&미니디저트", "id", 2, "https://sitem.ssgcdn.com/52/90/67/item/1000344679052_i1_750.jpg"),
  Category (13, "샌드위치&샐러드", "id", 2, "https://cdn.foodnews.co.kr/news/photo/201310/47546_5119_5453.jpg"),
  Category (14, "따뜻한푸드", "id", 2, "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9300000002435]_20210421164422886.jpg"),
  Category (15, "과일&요거트", "id", 2, "https://img.seoul.co.kr//img/upload/2015/03/27/SSI_20150327145713.jpg"),
  Category (16, "스낵", "id", 2, "https://mblogthumb-phinf.pstatic.net/MjAxNzEwMDhfNjIg/MDAxNTA3NDcyNTgxMTM1.uCv80sfMMTNdqGDZjLn8i9jKrfOL6quV8RTNWYV7nCUg.K0f8Ad6V_2wnAJJED134wjtLZsL9rXwsm4Grcu1ZYnkg.PNG.etienne03/667.PNG?type=w800"),
  Category (17, "아이스크림", "id", 2, "https://mblogthumb-phinf.pstatic.net/MjAxODAxMzBfMTE4/MDAxNTE3MzE3MjczNDA2.UBgWhfp1nY6iP00eHR6gXp0fJJ7d_sjSr-w264Vxmisg.AqE_V85EfIf6xDXckQZHDNBE8akIW9mNaCq_61Scxawg.JPEG.amera9128/IMG_2132.JPG?type=w800")
];

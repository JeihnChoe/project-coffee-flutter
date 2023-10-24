class Product {
  final int id; // PK
  final String productName; // 상품명
  final String productEngName; // 상품영문명
  final int code; // 상품코드 (음료1 푸드2)
  final String description; // 상품설명
  final String productPicUrl; // 상품이미지
  final int productPrice; // 가격
  final String note; // hot,new,best
  final String productInfo; // 제품영양정보
  final String? productAllergy;

  Product(
    this.id,
    this.productName,
    this.productEngName,
    this.code,
    this.description,
    this.productPicUrl,
    this.productPrice,
    this.note,
    this.productInfo,
    this.productAllergy,
  ); // 알레르기유발요인
}

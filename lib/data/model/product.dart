class Product {
  int id; // PK
  String productName; // 상품명
  String productEngName; // 상품영문명
  int code; // 상품코드 (음료1 푸드2)
  String description; // 상품설명
  String image; // 상품이미지
  int productPrice; // 가격
  String note; // hot,new,best
  String productInfo; // 제품영양정보
  String productAllergy;

  Product(
      this.id,
      this.productName,
      this.productEngName,
      this.code,
      this.description,
      this.image,
      this.productPrice,
      this.note,
      this.productInfo,
      this.productAllergy); // 알레르기유발요인

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "productEngName": productEngName,
        "code": code,
        "description": description,
        "image": image,
        "productPrice": productPrice,
        "note": note,
        "productInfo": productInfo,
        "productAllergy": productAllergy
      };

  Product.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        productName = json["productName"],
        productEngName = json["productEngName"],
        code = json["code"],
        description = json["description"],
        image = json["image"],
        productPrice = json["productPrice"],
        note = json["note"],
        productInfo = json["productInfo"],
        productAllergy = json["productAllergy"];
}

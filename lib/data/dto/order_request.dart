class CategoryReqDTO {
  final int id;
  final String name;
  final String engName;
  final int code; // 0 : 음료 , 1 : 푸드
  final String picUrl;

  CategoryReqDTO({
    required this.id,
    required this.name,
    required this.engName,
    required this.code,
    required this.picUrl,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "engName": engName,
        "code": code,
        "picUrl": picUrl,
      };

  CategoryReqDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        engName = json["engName"],
        code = json["code"],
        picUrl = json["picUrl"];
}

class ProductListResDTO {
  int productId;
  String name;
  String engName;
  String picUrl;
  int optionId;
  int price;

  ProductListResDTO(this.productId, this.name, this.engName, this.picUrl,
      this.optionId, this.price);

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": name,
        "engName": engName,
        "picUrl": picUrl,
        "optionId": optionId,
        "price": price,
      };

  ProductListResDTO.fromJson(Map<String, dynamic> json)
      : productId = json["productId"],
        name = json["name"],
        engName = json["engName"],
        picUrl = json["picUrl"],
        optionId = json["optionId"],
        price = json["price"];
}

class ProductOrderReqDTO {
  int? optionId; // 옵션아이디
  int? isIced; //선택된 핫 아이스
  int? quantity; // 갯수
  int? sizeId; // 사이즈 Id값
  int? cuptype; // 컵타입
  int? sizePrice; //이거뺴고 보낼꺼임
  int? totalPrice; // 총 가격
  int? userId;

  ProductOrderReqDTO(
      {this.optionId,
      this.isIced,
      this.quantity,
      this.sizeId,
      this.cuptype,
      this.sizePrice,
      this.totalPrice,
      this.userId}); // 유저Id  비회원일시 0

  //
  Map<String, dynamic> toJson() => {
        "optionId": optionId,
        "isIced": isIced,
        "quantity": quantity,
        "sizeId": sizeId,
        "cuptype": cuptype,
        "totalPrice": totalPrice,
        "userId": userId
      };

  ProductOrderReqDTO.fromJson(Map<String, dynamic> json)
      : optionId = json["optionId"],
        isIced = json["isIced"],
        quantity = json["quantity"],
        sizeId = json["sizeId"],
        cuptype = json["cuptype"],
        totalPrice = json["totalPrice"],
        userId = json["userId"];
}

class ProductDetailResDTO {
  int productId;
  String picUrl;
  String productName;
  String productEngName;
  int optionId;
  int optionPrice;
  int? isIced;
  String tip;
  String? description;
  int? sizeType;

  ProductDetailResDTO(
    this.productId,
    this.picUrl,
    this.productName,
    this.productEngName,
    this.optionId,
    this.optionPrice,
    this.isIced,
    this.tip,
    this.description,
    this.sizeType,
  );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "picUrl": picUrl,
        "productName": productName,
        "productEngName": productEngName,
        "optionId": optionId,
        "optionPrice": optionPrice,
        "isIced": isIced,
        "tip": tip,
        "description": description,
        "sizeType": sizeType,
      };

  ProductDetailResDTO.fromJson(Map<String, dynamic> json)
      : productId = json["productId"],
        picUrl = json["picUrl"],
        productName = json["productName"],
        productEngName = json["productEngName"],
        optionId = json["optionId"],
        optionPrice = json["optionPrice"],
        isIced = json["isIced"],
        tip = json["tip"],
        description = json["description"],
        sizeType = json["sizeType"];
}

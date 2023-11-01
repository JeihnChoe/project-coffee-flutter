class CategoryReqDTO{
  final int id;
  final String categoryName;
  final String categoryEngName;
  final int code;  // 0 : 음료 , 1 : 푸드
  final String categoryPicUrl;

  CategoryReqDTO({
    required this.id,
    required this.categoryName,
    required this.categoryEngName,
    required this.code,
    required this.categoryPicUrl,
  });

  Map<String, dynamic> toJson() => {
    "id" : id,
    "categoryName" : categoryName,
    "categoryEngName" : categoryEngName,
    "code" : code,
    "categoryPicUrl" : categoryPicUrl,
  };

  CategoryReqDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        categoryName = json["categoryName"],
        categoryEngName = json["categoryEngName"],
        code = json["code"],
        categoryPicUrl = json["categoryPicUrl"];

}
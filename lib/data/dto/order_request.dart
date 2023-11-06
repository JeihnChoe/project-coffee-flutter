import 'package:project_coffee/data/model/beverage.dart';

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

class BeverageReqDTO{

  final int id;
  final String beverageName;
  final String beverageEngName;
  final String beverageDescription;
  final String beverageTip;
  final String hotIce;  //
  final String beveragePicUrl;
  final int category;
  BeverageReqDTO({
    required this.id,
    required this.beverageName,
    required this.beverageEngName,
    required this.beverageDescription,
    required this.beverageTip,
    required this.hotIce,
    required this.beveragePicUrl,
    required this.category
  });

  Map<String, dynamic> toJson() => {
    "id" : id,
    "beverageName" : beverageName,
    "beverageEngName" : beverageEngName,
    "beverageDescription" : beverageDescription,
    "beverageTip" : beverageTip,
    "hotIce" : hotIce,
    "beveragePicUrl" : beveragePicUrl,
    "category" : category,

  };

  BeverageReqDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        beverageName = json["beverageName"],
        beverageEngName = json["beverageEngName"],
        beverageDescription = json["beverageDescription"],
        beverageTip = json["beverageTip"],
        hotIce = json["hotIce"],
        beveragePicUrl = json["beveragePicUrl"],
        category = json["category"];
}

class BeverageOrderReqDTO{
  Beverage beverage;
   int? isIced;
   int? count;
   int? size;
   int? cup;
   int? totalmoney;
   BeverageOrderReqDTO({required this.beverage,this.isIced,this.count,this.cup,this.size,this.totalmoney});
   Map<String, dynamic> toJson() =>
       {
         "beverage": beverage,
         "isIced": isIced,
         "count": count,
         "size": size,
         "cup": cup
       };
  BeverageOrderReqDTO.fromJson(Map<String, dynamic> json)
      : beverage = json["beverage"],
        isIced = json["isIced"],
        count =  json["count"],
        size =  json["size"],
        cup =  json["cup"];
}
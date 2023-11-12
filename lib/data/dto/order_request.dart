import 'package:flutter/foundation.dart';
import 'package:project_coffee/data/model/product.dart';

import '../model/option.dart';

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

  ProductListResDTO(this.productId, this.name, this.engName, this.picUrl, this.optionId ,this.price);

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "name": name,
        "engName": engName,
        "picUrl": picUrl,
        "optionId": optionId,
        "price" : price,
      };

  ProductListResDTO.fromJson(Map<String, dynamic> json)
      : productId = json["productId"],
        name = json["name"],
        engName = json["engName"],
        picUrl = json["picUrl"],
        optionId = json["optionId"],
        price = json["price"];
}
class ProductResDTO{
  ProductListResDTO productList;

  ProductResDTO(this.productList);
  Map<String ,dynamic> toJson() => {
    "productList" : productList,
  };

  ProductResDTO.fromJson(Map<String,dynamic> json)
  : productList = json["productList"];
}


class sampleProductListResDTO {
  Product product;
  int optionPrice;

  sampleProductListResDTO(this.product, this.optionPrice);

  Map<String, dynamic> toJson() => {
        "product": product,
        "optionPrice": optionPrice,
      };

  sampleProductListResDTO.fromJson(Map<String, dynamic> json)
      : product = json["product"],
        optionPrice = json["optionPrice"];
}

class ProductOrderReqDTO {
  Product product;
  Option option;
  int? isIced;
  int? count;
  int? size;
  int? cup;
  int? sizePrice;
  int? totalmoney;

  ProductOrderReqDTO(
      {required this.product,
      required this.option,
      this.isIced,
      this.count,
      this.cup,
      this.size,
      this.sizePrice,
      this.totalmoney});

  //
  Map<String, dynamic> toJson() => {
        "product": product,
        "option": option,
        "isIced": isIced,
        "count": count,
        "size": size,
        "cup": cup,
        "SizePrice": sizePrice,
        "totalmoney": totalmoney
      };

  //
  ProductOrderReqDTO.fromJson(Map<String, dynamic> json)
      : product = json["product"],
        option = json["option"],
        isIced = json["isIced"],
        count = json["count"],
        size = json["size"],
        cup = json["cup"],
        sizePrice = json["sizePrice"],
        totalmoney = json["totalmoney"];
}

class ProductDetailResDTO {
  Product product;
  Option option;

  ProductDetailResDTO(this.product, this.option);

  Map<String, dynamic> toJson() => {
        "product": product,
        "option": option,
      };

  ProductDetailResDTO.fromJson(Map<String, dynamic> json)
      : product = json["product"],
        option = json["option"];
}

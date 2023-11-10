import 'package:flutter/foundation.dart';
import 'package:project_coffee/data/model/product.dart';

import '../model/option.dart';

class CategoryReqDTO {
  final int id;
  final String categoryName;
  final String categoryEngName;
  final int code; // 0 : 음료 , 1 : 푸드
  final String categoryPicUrl;

  CategoryReqDTO({
    required this.id,
    required this.categoryName,
    required this.categoryEngName,
    required this.code,
    required this.categoryPicUrl,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryName": categoryName,
        "categoryEngName": categoryEngName,
        "code": code,
        "categoryPicUrl": categoryPicUrl,
      };

  CategoryReqDTO.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        categoryName = json["categoryName"],
        categoryEngName = json["categoryEngName"],
        code = json["code"],
        categoryPicUrl = json["categoryPicUrl"];
}

class ProductListResDTO {
  Product product;
  int optionPrice;

  ProductListResDTO(
      {required this.product, required this.optionPrice});

  Map<String, dynamic> toJson() => {

        "product": product,
        "optionPrice": optionPrice,
      };

ProductListResDTO.fromJson(Map<String, dynamic> json) :

        product = json["product"],
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
        this.totalmoney
      }
      );
  //
  Map<String, dynamic> toJson() => {
        "product": product,
    "option" :option,
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
class ProductDetailResDTO{
  Product product;
  Option option;

  ProductDetailResDTO(this.product, this.option);

  Map<String, dynamic> toJson() => {
  "product" : product,
  "option" : option,
  };
  ProductDetailResDTO.fromJson(Map<String, dynamic> json) :
      product = json["product"],
      option = json["option"];
}
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


class ProductOrderReqDTO {
  int? productId;
  int? isIced;
  int? count;
  int? size;
  int? cup;
  int? sizePrice;
  int? totalmoney;

  ProductOrderReqDTO({
      this.productId,
      this.isIced,
      this.count,
      this.cup,
      this.size,
      this.sizePrice,
      this.totalmoney});

  //
  Map<String, dynamic> toJson() => {
        "productId": productId,
        "isIced": isIced,
        "count": count,
        "size": size,
        "cup": cup,
        "SizePrice": sizePrice,
        "totalmoney": totalmoney
      };

  //
  ProductOrderReqDTO.fromJson(Map<String, dynamic> json)
      : productId = json["productId"],
        isIced = json["isIced"],
        count = json["count"],
        size = json["size"],
        cup = json["cup"],
        sizePrice = json["sizePrice"],
        totalmoney = json["totalmoney"];
}

class ProductDetailResDTO {
  int productId;
  String picUrl;
  String productName;
  String productEngName;
  int optionId;
  int optionPrice;
  int isIced;
  String tip;
  String discription;
  String size;


  ProductDetailResDTO(
      this.productId,
      this.picUrl,
      this.productName,
      this.productEngName,
      this.optionId,
      this.optionPrice,
      this.isIced,
      this.tip,
      this.discription,
      this.size);

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "picUrl" : picUrl,
        "productName": productName,
        "productEngName": productEngName,
        "optionId": optionId,
        "optionPrice": optionPrice,
        "isIced": isIced,
        "tip": tip,
        "discription": discription,
        "size": size,

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
        discription = json["discription"],
        size = json["size"];
}
class ProductDetailViewDTO{
  ProductListResDTO productListResDTO;
  ProductDetailResDTO productDetailResDTO;

  ProductDetailViewDTO(this.productListResDTO, this.productDetailResDTO);
}
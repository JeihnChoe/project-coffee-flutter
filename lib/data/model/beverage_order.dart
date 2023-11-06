import 'package:project_coffee/data/model/beverage.dart';

class BeverageOrder {
  final Beverage beverage;
  int? isIced;  //0 아이스 , 1: 핫
  int? count;
  int? size;
  int? cup;

  BeverageOrder(this.beverage, this.isIced, this.count, this.size, this.cup);

  BeverageOrder.formJson(Map<String, dynamic> json)
      : beverage = json["beverage"],
        isIced = json["isIced"],
        count = json["count"],
        size = json["size"],
        cup = json["cup"];
}

import 'package:project_coffee/data/model/beverage.dart';

class BeverageOrder {
  final Beverage beverage;
  int? isIced; //0 아이스 , 1: 핫
  int? count;
  int? size;
  int? cup;
  int? sizePrice;
  int? totalMoney;

  BeverageOrder(this.beverage, this.isIced, this.count, this.size, this.cup ,this.sizePrice,
  this.totalMoney);
}

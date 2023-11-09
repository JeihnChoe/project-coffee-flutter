import 'package:project_coffee/data/model/beverage.dart';

class BeverageOrder {
  final Beverage beverage;
  int? isIced; //0 아이스 , 1: 핫
  int? count;  //qantity로 변경
  String? size; // 1 : tall ,2 : grande , 3: venti 4 : torenta , 5 : solo , 6 : dopio, 7  : small
  String? cup;  //   int로 할까 스트링으로 할까
  int? sizePrice;   //사이즈 값
  int? totalMoney;  // 전체 가격

  BeverageOrder(this.beverage, this.isIced, this.count, this.size, this.cup ,this.sizePrice,
  this.totalMoney);
}

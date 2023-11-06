import 'package:project_coffee/data/model/beverage.dart';

class BeverageOrder {
  final Beverage beverage;
  int? isIced;
  int? count;
  int? size;
  int? cup;

  BeverageOrder(
      this.beverage,this.isIced,this.count,this.size,this.cup
      );
}

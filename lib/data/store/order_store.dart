

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/beverage.dart';
import 'package:project_coffee/data/repository/beverage_repostory.dart';
import 'package:project_coffee/main.dart';

class BeverageModel{
  Beverage? beverage;
  BeverageModel({this.beverage});
}

class BeverageStore extends BeverageModel {
  final mContext = navigatorKey.currentContext;

  Future<void> cart(BeverageOrderReqDTO beverageOrderReqDTO) async{
    ResponseDTO responseDTO = await BeverageRepository().fetchBeverageCartSave(beverageOrderReqDTO);
    // Navigator.pushNamed(mContext!, Move.PayMainPage);
  }

}

//창고 관리자
final beverageProvider = Provider<BeverageStore>((ref) {
  return BeverageStore();
});

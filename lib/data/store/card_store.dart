//창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/move.dart';
import 'package:project_coffee/data/dto/card_request.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/main.dart';

import '../dto/reponse_dto.dart';

class PayCardChargeModel{
  PayCard? card;
  PayCardChargeModel({this.card});
}

class PayCardChargeStore extends PayCardChargeModel {
  final mContext = navigatorKey.currentContext;

  Future<void> charge(CardChargeReqDTO cardChargeReqDTO) async {
    Navigator.pushNamed(mContext!, Move.MainPage);
    // Navigator.push(mContext, JoinSucessPage())
  }
}

//창고 관리자
final cardChargeProvider = Provider<PayCardChargeStore>((ref) {
  return PayCardChargeStore();
});

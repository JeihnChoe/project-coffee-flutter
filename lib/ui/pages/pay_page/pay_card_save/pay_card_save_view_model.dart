//창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/move.dart';
import 'package:project_coffee/data/dto/card_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/paycard.dart';
import 'package:project_coffee/data/repository/card_repository.dart';
import 'package:project_coffee/main.dart';

class PayCardModel {
  PayCard? card;
  PayCardModel({this.card});
}

class PayCardStore extends PayCardModel {
  final mContext = navigatorKey.currentContext;

  // PayCardStore();

  Future<void> charge(CardChargeReqDTO cardChargeReqDTO) async {
    Navigator.pushNamed(mContext!, Move.MainPage);
    // Navigator.push(mContext, JoinSucessPage())
  }

  Future<void> save(CardSaveReqDTO cardSaveReqDTO, String? token) async {
    try {
      ResponseDTO responseDTO =
          await CardRepository().fetchCardSave(cardSaveReqDTO, token);
      Logger().d("카드 등록 중 ${responseDTO.response}");
      Logger().d("카드 등록 중 ${responseDTO.success}");

      if (responseDTO.success == true) {
        Navigator.pushNamed(mContext!, Move.PayMainPage);
        Logger().d("카드 등록 $responseDTO");
      } else {
        ScaffoldMessenger.of(mContext!)
            .showSnackBar(SnackBar(content: Text(responseDTO.error)));
      }
    } catch (e) {
      Logger().e("카드 등록 중 오류: $e");
    }
  }
}

//창고 관리자
final cardProvider = Provider<PayCardStore>((ref) {
  return PayCardStore();
});

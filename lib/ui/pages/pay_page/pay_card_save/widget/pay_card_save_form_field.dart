import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/_core/constants/color.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/constants/style.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/data/dto/card_request.dart';
import 'package:project_coffee/data/store/session_store.dart';
import 'package:project_coffee/ui/pages/pay_page/pay_card_save/pay_card_save_view_model.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';

class CardSaveFormField extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _cardName = TextEditingController();
  final _cardNumber = TextEditingController();
  final _pinNumber = TextEditingController();
  CardSaveFormField({super.key});

  void submit(WidgetRef ref) async {
    SessionStore sessionUser = ref.read(sessionProvider);

    if (_formKey.currentState!.validate()) {
      CardSaveReqDTO cardSaveReqDTO = CardSaveReqDTO(
        cardName: _cardName.text,
        cardNumber: _cardNumber.text,
        pinNumber: _pinNumber.text,
      );

      Logger().d("CardSaveReqDTO : ${cardSaveReqDTO.toJson()}");
      if (sessionUser!.isLogin == true) {
        Logger().d("카드등록그림그리자 토큰 : ${sessionUser.isLogin}");
        //CardRepository().fetchCardSave(cardSaveReqDTO, sessionUser.jwt);
        ref.read(cardProvider).save(cardSaveReqDTO, sessionUser.jwt);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextForm("CardName",
                validatorFunction: validateCardName, controller: _cardName),
            SizedBox(
              height: gap_m,
            ),
            Text(
              "카드명은 미입력 시 자동으로 부여됩니다.",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            SizedBox(
              height: gap_l,
            ),
            CustomTextForm("CardNumber",
                validatorFunction: validateCardNumber, controller: _cardNumber),
            SizedBox(
              height: gap_m,
            ),
            SizedBox(
              height: gap_l,
            ),
            CustomTextForm("PinNumber",
                validatorFunction: validatePinNumber, controller: _pinNumber),
            CardSaveGreyTextFeild(),
          ],
        ),
      ),
    );
  }
}

Container CardSaveGreyTextFeild() {
  return Container(
    padding: EdgeInsets.all(10),
    width: double.infinity,
    color: Colors.grey[100],
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textBody3("스타벅스 카드 등록 시, 실물 카드와 카드 바코드 모두 사용 가능합\n니다."),
        Row(
          children: [
            textBody3("카드가 없다면 e-Gift Card의"),
            TextButton(
                onPressed: () {},
                child: Text(
                  "나에게 선물하기",
                  style: TextStyle(fontSize: 11, color: kAccentColor),
                )),
            textBody3("를 이용해보세요.")
          ],
        ),
        textBody3("카드명은 미입력 시 자동으로 부여됩니다."),
      ],
    ),
  );
}

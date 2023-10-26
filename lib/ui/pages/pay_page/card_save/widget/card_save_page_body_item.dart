import 'package:flutter/material.dart';
import 'package:project_coffee/_core/constants/size.dart';
import 'package:project_coffee/_core/utils/validator_util.dart';
import 'package:project_coffee/ui/widgets/custom_text_form_field.dart';

class CardSaveTextFormFeild extends StatelessWidget {
  const CardSaveTextFormFeild({
    super.key,
    required TextEditingController cardName,
    required TextEditingController cardNumber,
    required TextEditingController pinNumber
  }) : _cardName = cardName, _cardNumber = cardNumber,_pinNumber =pinNumber ;

  final TextEditingController _cardName;
  final TextEditingController _cardNumber;
  final TextEditingController _pinNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextForm("CardName",validatorFunction:validateCardName, controller: _cardName),
        SizedBox(height: gap_m,),
        Text("카드명은 미입력 시 자동으로 부여됩니다.",style: TextStyle(color: Colors.grey,fontSize: 13),),
        SizedBox(height: gap_l,),
        CustomTextForm("CardNumber",validatorFunction:validateCardNumber, controller: _cardNumber),
        SizedBox(height: gap_m,),
        SizedBox(height: gap_l,),
        CustomTextForm("PinNumber",validatorFunction:validatePinNumber, controller: _pinNumber),
      ],
    );
  }
}

class GreyBoxHeight extends StatelessWidget {
  const GreyBoxHeight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: gap_xxl,),
        SizedBox(height: gap_xl,),
        SizedBox(height: gap_m,),
      ],
    );
  }
}

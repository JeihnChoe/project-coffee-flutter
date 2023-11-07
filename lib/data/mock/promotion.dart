import 'package:project_coffee/data/dto/reponse_dto.dart';

import '../model/promotion.dart';

ResponseDTO mPromotionResponseDTO = ResponseDTO(true, _mPromotion, null);
// ResponseDTO mPromotionListResponseDTO =
//     ResponseDTO(true, _mPromotionList, null);

Promotion _mPromotion = Promotion(
  1,
  "10월 24일, AUTUMN PICNIC PICK!",
  "더 강력한 혜택과 함께 쇼핑라이브에서 만나보세요.",
  "23-10-24",
  "23-10-31",
  "https://image.istarbucks.co.kr/upload/banner/FV9avW_20230927104456049.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc5Et4eUZvNe4bW8AvpGci_lmk5Gq54kGkgA&usqp=CAU",
);

List<Promotion> _mPromotionList = [
  Promotion(
    1,
    "10월 24일, AUTUMN PICNIC PICK!",
    "더 강력한 혜택과 함께 쇼핑라이브에서 만나보세요.",
    "23-10-24",
    "23-10-31",
    "http://thumb.mtstarnews.com/06/2023/10/2023102309530696106_1.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc5Et4eUZvNe4bW8AvpGci_lmk5Gq54kGkgA&usqp=CAU",
  ),
];

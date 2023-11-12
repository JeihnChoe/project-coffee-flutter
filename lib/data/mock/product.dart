import 'package:project_coffee/data/dto/order_request.dart';
import 'package:project_coffee/data/dto/reponse_dto.dart';
import 'package:project_coffee/data/model/option.dart';
import 'package:project_coffee/data/model/product.dart';
import 'package:project_coffee/data/model/size.dart';

import '../model/product_order.dart';


ResponseDTO mProductResponseDTO = ResponseDTO(true, _mProduct, null,);

// ResponseDTO mProductOrderResponseDTO = ResponseDTO(true, productDetailResDTO, null);
ResponseDTO mProductOrderListResponseDTO = ResponseDTO(true, _mproductOrderList, null);

Product _mProduct = Product(
    1,
    "나이트로바닐라크림",
    "Nitro Vanilla Cream",
    "부드러운 목넘김의 나이트로 커피와 바닐라 크림의 매력을 한번에 느껴보세요!",
    "디카페인결제시 300원 추가됩니다.",
    0,
    "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000002487]_20210426091745609.jpg",
    1);
Product mProduct2 = Product(
    2,
    "바닐라 크림 콜드 브루",
    "Vanilla Cream Cold Brew",
    "콜드 브루에 더해진 바닐라 크림으로 깔끔하면서 달콤한 콜드 브루를 새롭게 즐길 수 있는 음료입니다.",
    "디카페인결제시 300원 추가됩니다.",
    2,
    "https://image.istarbucks.co.kr/upload/store/skuimg/2021/04/[9200000002487]_20210426091745609.jpg",
    2,);
ProductOrder _productOrder = ProductOrder( _mProduct, 1, 2, "1", "1", 505, 9999);

// ProductDetailResDTO productAndOption = ProductDetailResDTO();

// ProductDetailResDTO productDetailResDTO = ProductDetailResDTO(_mProduct,_mOption);


List<ProductOrder> _mproductOrderList = [
  ProductOrder(
      _mProduct,
      1,
      2,
      "1",
      "1",
      505,
      9999),
  ProductOrder(
      _mProduct,
      1,
      2,
      "1",
      "1",
      505,
      9999),
  ProductOrder(
      _mProduct,
      1,
      2,
      "1",
      "1",
      505,
      9999),
];


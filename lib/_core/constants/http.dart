import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// http 통신
final dio = Dio(
  BaseOptions(
<<<<<<< HEAD
    baseUrl: "http://192.168.0.79:8080", // 내 IP 입력
=======
    baseUrl: "http://192.168.0.118:8080", // 내 IP 입력
>>>>>>> 061c0750f50189513bd99070136bdfd21cdd9995
    contentType: "application/json; charset=utf-8",
  ),
);

// 휴대폰 로컬에 파일로 저장
const secureStorage = FlutterSecureStorage();

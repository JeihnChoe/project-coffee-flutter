// 1. 창고 데이터
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:project_coffee/main.dart';

class RequestParam {
  int? postDetailId;
  RequestParam({this.postDetailId});
}

// 2. 창고 (비지니스 로직)
class ParamStore extends RequestParam {
  final mContext = navigatorKey.currentContext;
}

// 3. 창고 관리자
final paramProvider = Provider<ParamStore>((ref) {
  Logger().d("파람스토어 : 이거 때려짐.");
  return ParamStore();
});

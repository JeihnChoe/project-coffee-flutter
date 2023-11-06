
import 'package:project_coffee/data/dto/reponse_dto.dart';

import 'package:project_coffee/data/mock/stores.dart';

class StoresRepository {
  Future<ResponseDTO> fetchStoresDetail() {
    return Future.delayed(Duration(seconds: 3), () => mStoresResponseDTO);
  }

  Future<ResponseDTO> fetchStoresDetailList() {
    return Future.delayed(Duration(seconds: 3), () => mStoresListResponseDTO);
  }

}


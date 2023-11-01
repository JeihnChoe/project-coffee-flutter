import 'package:logger/logger.dart';
import 'package:validators/validators.dart';

String? validateUserId(String? value) {
  if (value == null || value.isEmpty) {
    return "아이디에 들어갈 수 없습니다.";
  } else if (!isAlphanumeric(value)) {
    return "아이디에 한글이나 특수 문자가 들어갈 수 없습니다.";
  } else if (value.length > 12) {
    return "아이디의 길이를 초과하였습니다.";
  } else if (value.length < 3) {
    return "아이디의 최소 길이는 3자입니다.";
  }
  return null; // 유효성 검사 통과
}


String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return "패스워드 공백이 들어갈 수 없습니다.";
  } else if (value.length > 12) {
    return "패스워드의 길이를 초과하였습니다.";
  } else if (value.length < 4) {
    return "패스워드의 최소 길이는 4자입니다.";
  }
  return null; // 유효성 검사 통과
}

String? validatePasswordChk(String? value) {
  if (value == null || value.isEmpty) {
    return "패스워드 공백이 들어갈 수 없습니다.";
  } else if (value.length > 12) {
    return "패스워드의 길이를 초과하였습니다.";
  } else if (value.length < 4) {
    return "패스워드의 최소 길이는 4자입니다.";
  }
  Logger().d(value);
  return null; // 유효성 검사 통과
}
bool arePasswordsEqual(String? password, String? passwordChk) {
  // 두 값이 모두 유효하고 서로 같은지 확인

  return validatePassword(password) == null &&
      validatePasswordChk(passwordChk) == null &&
      password == passwordChk;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "이메일은 공백이 들어갈 수 없습니다.";
  } else if (!isEmail(value)) {
    return "이메일 형식에 맞지 않습니다.";
  }
  return null; // 유효성 검사 통과
}

String? validateTitle(String? value) {
  if (value == null || value.isEmpty) {
    return "제목은 공백이 들어갈 수 없습니다.";
  } else if (value.length > 30) {
    return "제목의 길이를 초과하였습니다.";
  }
  return null; // 유효성 검사 통과
}

String? validateContent(String? value) {
  if (value == null || value.isEmpty) {
    return "내용은 공백이 들어갈 수 없습니다.";
  } else if (value.length > 500) {
    return "내용의 길이를 초과하였습니다.";
  }
  return null; // 유효성 검사 통과
}

String? validatePhoneNumber(String? value) {
  // if (value == null || value.isEmpty) {
  //   return "내용은 공백이 들어갈 수 없습니다.";
  // } else if (value.length > 500) {
  //   return "내용의 길이를 초과하였습니다.";
  // }
  return null; // 유효성 검사 통과
}
String? validateCardName(String? value) {
  // if (value == null || value.isEmpty) {
  //   return "내용은 공백이 들어갈 수 없습니다.";
  // } else if (value.length > 500) {
  //   return "내용의 길이를 초과하였습니다.";
  // }
  return null; // 유효성 검사 통과
}
String? validateCardNumber(String? value) {
  if (value == null || value.isEmpty) {
    return "내용은 공백이 들어갈 수 없습니다.";
  } else if (value.length > 17) {
    return "내용의 길이를 초과하였습니다.";
  }else if(!isNumeric(value)){
    return "숫자만 입력해주세요";
  }

  return null; // 유효성 검사 통과
}

String? validatePinNumber(String? value) {
  // if (value == null || value.isEmpty) {
  //   return "내용은 공백이 들어갈 수 없습니다.";
  // } else if (value.length > 500) {
  //   return "내용의 길이를 초과하였습니다.";
  // }
  return null; // 유효성 검사 통과
}
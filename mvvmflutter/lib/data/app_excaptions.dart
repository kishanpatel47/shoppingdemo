class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String tostring() {
    return '$_message$_prefix';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? messgae])
      : super(messgae, 'error During Communiton');
}

class BadRequestException extends AppException {
  BadRequestException([String? messgae]) : super(messgae, 'Invalid requets');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? messgae])
      : super(messgae, ' Unauthorised requets');
}

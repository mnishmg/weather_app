class ApiExceptions implements Exception {
  String? heading, msg;

  ApiExceptions({this.heading, this.msg});

  @override
  String toString() {
    return '$heading: $msg';
  }
}

class UnauthorisedException extends ApiExceptions {
  UnauthorisedException(String msg)
      : super(heading: 'Unauthorised Exception', msg: msg);
}

class NotFoundException extends ApiExceptions {
  NotFoundException(String msg) : super(heading: 'City Not Found', msg: msg);
}

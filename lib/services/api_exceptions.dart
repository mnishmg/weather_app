class ApiExceptions implements Exception {
  String? heading, msg;
  
  // Constructor for the ApiExceptions class.
  ApiExceptions({this.heading, this.msg});

  @override
  String toString() {
    // Override the toString method to return a formatted string of the exception.
    return '$heading: $msg';
  }
}

class UnauthorisedException extends ApiExceptions {
  // Constructor for the UnauthorisedException class.
  UnauthorisedException(String msg)
      : super(heading: 'Unauthorised Exception', msg: msg);
}

class NotFoundException extends ApiExceptions {
  // Constructor for the NotFoundException class.
  NotFoundException(String msg) : super(heading: 'City Not Found', msg: msg);
}

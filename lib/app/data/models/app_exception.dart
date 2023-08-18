class AppException implements Exception {
  final String _message;
  final String _prefix;

  AppException(this._message, this._prefix);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class UnauthorisedException extends AppException {
  UnauthorisedException(message) : super(message, "Unauthorised: ");
}

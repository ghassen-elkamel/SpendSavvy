part of 'api_provider.dart';

class HttpParamsPostPut extends HttpParams {
  final Map<String, dynamic> body;

  HttpParamsPostPut({
    required super.endpoint,
    super.externalHost,
    super.headers,
    super.queryParam,
    super.isUnderAPI,
    super.authorization,
    super.withLoadingAlert,
    required this.body,
    super.encodeBody,
    super.isFormData,
  });
}

class HttpParamsGetDelete extends HttpParams {
  HttpParamsGetDelete({
    required super.endpoint,
    super.externalHost,
    super.headers,
    super.queryParam,
    super.isUnderAPI,
    super.authorization,
    super.withLoadingAlert,
  });
}

class HttpParams {
  final String endpoint;
  final String? externalHost;
  final Map<String, String> headers;
  final Map<String, String>? queryParam;
  final bool encodeBody;
  final bool isFormData;
  final String? authorization;
  final bool isUnderAPI;
  final bool withLoadingAlert;

  HttpParams({
    required this.endpoint,
    this.externalHost,
    this.headers = const {},
    required this.queryParam,
    this.isUnderAPI = false,
    this.authorization,
    this.withLoadingAlert = true,
    this.encodeBody = true,
    this.isFormData = false,
  });
}

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/utils/constant.dart';
import '../../data/providers/api_provider_helper.dart';

part 'api_provider_params.dart';

class ApiProvider {
  static ApiProvider? _instance;

  ApiProvider._internal();

  factory ApiProvider() {
    _instance ??= ApiProvider._internal();
    return _instance!;
  }

  Future<Map<String, dynamic>?> get(HttpParamsGetDelete params,
      {int attempt = 0}) async {
    dynamic responseJson;
    showLoadingAlert(withLoadingAlert: params.withLoadingAlert);

    try {
      final response = await http
          .get(
            getUri(params),
            headers: getHeaders(params),
          )
          .timeout(timeoutDuration);
      responseJson = await verifyResponse(
          response: response,
          attempt: attempt,
          callback: () => get(params, attempt: attempt + 1));
    } catch (exception) {
      catchException(exception);
    }
    hideLoadingAlert(withLoadingAlert: params.withLoadingAlert);
    return responseJson;
  }

  Future<Map<String, dynamic>?> post(HttpParamsPostPut params,
      {int attempt = 0}) async {
    dynamic responseJson;
    dynamic response;
    showLoadingAlert(withLoadingAlert: params.withLoadingAlert);
    Uri uri = getUri(params);

    try {
      if (params.isFormData) {
        var request = await getFormDataRequest("POST", uri, body: params.body);
        var responseStream = await request.send();
        response = await http.Response.fromStream(responseStream);
      } else {
        response = await http
            .post(
              uri,
              body: params.encodeBody ? jsonEncode(params.body) : params.body,
              headers: getHeaders(params),
            )
            .timeout(timeoutDuration);
      }
      responseJson = await verifyResponse(
          response: response,
          attempt: attempt,
          callback: () => post(
                params,
                attempt: attempt + 1,
              ));
    } catch (exception) {
      catchException(exception);
    }
    hideLoadingAlert(withLoadingAlert: params.withLoadingAlert);
    return responseJson;
  }

  Future<dynamic> delete(
    HttpParamsGetDelete params, {
    int attempt = 0,
  }) async {
    dynamic responseJson;
    showLoadingAlert(withLoadingAlert: params.withLoadingAlert);

    try {
      final response = await http
          .delete(
            getUri(params),
            headers: getHeaders(params),
          )
          .timeout(timeoutDuration);
      responseJson = await verifyResponse(
          response: response,
          attempt: attempt,
          callback: () => delete(params, attempt: attempt + 1));
    } catch (exception) {
      catchException(exception);
    }
    hideLoadingAlert(withLoadingAlert: params.withLoadingAlert);
    return responseJson;
  }

  Future<Map<String, dynamic>?> patch(HttpParamsPostPut params,
      {int attempt = 0}) async {
    dynamic responseJson;
    dynamic response;
    showLoadingAlert(withLoadingAlert: params.withLoadingAlert);
    Uri uri = getUri(params);
    try {
      if (params.isFormData) {
        var request = await getFormDataRequest(
          "PATCH",
          uri,
          body: params.body,
        );

        var responseStream = await request.send();

        response = await http.Response.fromStream(responseStream);
      } else {
        response = await http
            .patch(
              uri,
              body: params.encodeBody ? jsonEncode(params.body) : params.body,
              headers: getHeaders(params),
            )
            .timeout(timeoutDuration);
      }
      responseJson = await verifyResponse(
          response: response,
          attempt: attempt,
          callback: () => patch(params, attempt: attempt + 1));
    } catch (exception) {
      catchException(exception);
    }
    hideLoadingAlert(withLoadingAlert: params.withLoadingAlert);
    return responseJson;
  }
}

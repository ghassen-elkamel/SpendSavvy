import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../core/utils/constant.dart';
import '../../core/utils/helpers.dart';
import '../models/app_exception.dart';
import '../services/auth_service.dart';
import 'api_provider.dart';

extension Helper on ApiProvider {
  Uri getUri(HttpParams params) {
    return Uri(
        scheme: 'http',
        host: params.externalHost ?? host,
        port: port,
        path: "${params.isUnderAPI ? apiPrefix : ""}${params.endpoint}",
        queryParameters: params.queryParam);
  }

  Future<Map<String, dynamic>?> verifyResponse({
    required http.Response response,
    required int attempt,
    required dynamic callback,
  }) async {
    Map<String, dynamic>? data = json.decode(response.body.toString());
    switch (response.statusCode) {
      case 401:
        if (data != null && data["message"] != null) {
          AuthService authService = AuthService();
          if (attempt < 3 &&
              data["message"] is String &&
              (data["message"].contains("JWT") ||
                  data["message"].contains("Unauthorized"))) {
            bool refreshed = await authService.refreshToken();
            if (refreshed) {
              return await callback.call();
            }
          }

          showAlertDialog(
            title: data["message"],
          );
        }
        return null;
      case 400:
        if (data != null) {
          if (data["errors"] != null) {
            showErrors(data);
          } else if (data["message"] != null) {
            String message = "";
            if (data["message"] is String) {
              message = data["message"];
            } else {
              message = data["message"].join("\n");
            }
            showAlertDialog(
                title: data.containsKey("error") ? data["error"] : null,
                subTitle: message,
                image: "icons/alert.svg");
          }
        }
        return null;
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        if (data != null) {
          if (data["errors"] != null) {
            showErrors(data);
          } else if (data["message"] != null) {
            showAlertDialog(
              title: data["message"],
              subTitle: data.containsKey("error") ? data["error"] : null,
            );
          }
        }
        return null;
      case 500:
        showAlertDialog(
          subTitle: "internal-server-error".tr,
        );
        break;
      case 502:
        if (data != null && data["message"] != null) {
          showAlertDialog(
            title: data["message"],
          );
        }
        break;
      default:
        if (data != null && data["errors"] != null) {
          showErrors(data);
          return null;
        }
        return data;
    }
    return null;
  }

  Map<String, String> getHeaders(HttpParams params) {
    String? token = AuthService.access?.accessToken;

    return <String, String>{
      ...params.headers,
      'Content-Type': params.isFormData
          ? 'multipart/form-data'
          : !params.encodeBody
              ? 'application/x-www-form-urlencoded'
              : 'application/json',
      'Accept': 'application/json',
      if (token != null || params.authorization != null)
        'Authorization': params.authorization != null
            ? 'Basic ${params.authorization}'
            : 'Bearer $token',
    };
  }

  Future<http.MultipartRequest> getFormDataRequest(
    String method,
    Uri uri, {
    required Map<String, dynamic> body,
  }) async {
    String? token = AuthService.access?.accessToken;
    var request = http.MultipartRequest(method, uri);

    if (token != null) {
      request.headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }

    body.forEach((key, value) {
      if (value != null) {
        request.fields[key] = value;
      }
    });
    return request;
  }

  void catchException(exception) {
    log(exception.toString());
    if (exception is UnauthorisedException) {
      log("*Exception: UnauthorisedException");
    } else if (exception is http.ClientException ||
        exception is SocketException ||
        exception is TimeoutException) {
      log("*Exception: ClientException SocketException TimeoutException");
      showAlertDialog(
          title: "you-are-offline".tr, image: "icons/offline_internet.png");
    } else {
      log("*Exception: Server");
    }
  }

  showLoadingAlert({required bool withLoadingAlert}) async {
    if (withLoadingAlert && !EasyLoading.isShow) {
      await EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
      );
    }
  }

  hideLoadingAlert({required bool withLoadingAlert}) async {
    if (withLoadingAlert && EasyLoading.isShow) {
      await EasyLoading.dismiss();
    }
  }
}

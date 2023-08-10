// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
//
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// import '../../core/utils/constant.dart';
// import '../../routes/app_pages.dart';
// import '../models/app_exception.dart';
// import '../services/auth_service.dart';
//
// class ApiProvider {
//   static ApiProvider? _instance;
//
//   ApiProvider._internal();
//
//   factory ApiProvider() {
//     _instance ??= ApiProvider._internal();
//     return _instance!;
//   }
//
//   Future<Map<String, dynamic>?> get(
//       {required String endpoint,
//       String? externalHost,
//       Map<String, String>? headers,
//       Map<String, String>? queryParam,
//       bool isUnderAPI = true,
//       bool withLoadingAlert = true,
//       int attempt = 0}) async {
//     String? token = AuthService.access?.token;
//     dynamic responseJson;
//     if (withLoadingAlert && !EasyLoading.isShow) {
//       await EasyLoading.show(
//         maskType: EasyLoadingMaskType.black,
//       );
//     }
//     try {
//       final response = await http
//           .get(
//             Uri(
//                 scheme: 'http',
//                 host: externalHost ?? host,
//                 port: port,
//                 path: "${isUnderAPI ? apiPrefix : ""}$endpoint",
//                 queryParameters: queryParam),
//             headers: headers ??
//                 <String, String>{
//                   'Content-Type': 'application/json',
//                   'Accept': 'application/json',
//                   if (token != null) 'Authorization': 'Bearer $token',
//                 },
//           )
//           .timeout(timeoutDuration);
//       responseJson = await verifyResponse(
//           response: response,
//           attempt: attempt,
//           callback: () => get(
//               endpoint: endpoint,
//               headers: headers,
//               queryParam: queryParam,
//               isUnderAPI: isUnderAPI,
//               withLoadingAlert: withLoadingAlert,
//               externalHost: externalHost,
//               attempt: attempt + 1));
//     } catch (exception) {
//       catchException(exception);
//     }
//     if (withLoadingAlert && EasyLoading.isShow) {
//       await EasyLoading.dismiss();
//     }
//     return responseJson;
//   }
//
//   Future<Map<String, dynamic>?> put(
//       {required String endpoint,
//       required Map<String, dynamic>? body,
//       bool encodeBody = true,
//       String? externalHost,
//       Map<String, String> headers = const {},
//       Map<String, String>? queryParam,
//       bool isUnderAPI = true,
//       String? authorization,
//       bool withLoadingAlert = true,
//       bool isFormData = false,
//       int attempt = 0}) async {
//     String? token = AuthService.access?.token;
//
//     dynamic responseJson;
//     dynamic response;
//     if (withLoadingAlert && !EasyLoading.isShow) {
//       await EasyLoading.show(
//         maskType: EasyLoadingMaskType.black,
//       );
//     }
//     Uri uri = Uri(
//         scheme: 'http',
//         host: externalHost ?? host,
//         port: port,
//         path: "${isUnderAPI ? apiPrefix : ""}$endpoint",
//         queryParameters: queryParam);
//     try {
//       if (isFormData) {
//         var request = http.MultipartRequest("PUT", uri);
//         if (token != null) {
//           request.headers.addAll({
//             'Authorization': 'Bearer $token',
//           });
//         }
//         body!.forEach((key, value) {
//           request.fields[key] = value;
//         });
//         var responseStream = await request.send();
//         response = await http.Response.fromStream(responseStream);
//       } else {
//         response = await http.put(
//           uri,
//           body: encodeBody ? jsonEncode(body) : body,
//           headers: <String, String>{
//             ...headers,
//             'Content-Type': isFormData
//                 ? 'multipart/form-data'
//                 : !encodeBody
//                     ? 'application/x-www-form-urlencoded'
//                     : 'application/json',
//             'Accept': 'application/json',
//             if (token != null || authorization != null)
//               'Authorization': authorization != null
//                   ? 'Basic $authorization'
//                   : 'Bearer $token',
//           },
//         ).timeout(timeoutDuration);
//       }
//       responseJson = await verifyResponse(
//           response: response,
//           attempt: attempt,
//           callback: () => put(
//               endpoint: endpoint,
//               headers: headers,
//               queryParam: queryParam,
//               body: body,
//               authorization: authorization,
//               externalHost: externalHost,
//               withLoadingAlert: withLoadingAlert,
//               isUnderAPI: isUnderAPI,
//               isFormData: isFormData,
//               encodeBody: encodeBody,
//               attempt: attempt + 1));
//     } catch (exception) {
//       catchException(exception);
//     }
//     if (withLoadingAlert && EasyLoading.isShow) {
//       await EasyLoading.dismiss();
//     }
//     return responseJson;
//   }
//
//   Future<Map<String, dynamic>?> post(
//       {required String endpoint,
//       required Map<String, dynamic>? body,
//       bool encodeBody = true,
//       String? externalHost,
//       Map<String, String> headers = const {},
//       Map<String, String>? queryParam,
//       bool isUnderAPI = true,
//       String? authorization,
//       bool withLoadingAlert = true,
//       bool isFormData = false,
//       int attempt = 0}) async {
//     String? token = AuthService.access?.token;
//
//     dynamic responseJson;
//     dynamic response;
//     if (withLoadingAlert && !EasyLoading.isShow) {
//       await EasyLoading.show(
//         maskType: EasyLoadingMaskType.black,
//       );
//     }
//     Uri uri = Uri(
//         scheme: 'http',
//         host: externalHost ?? host,
//         port: port,
//         path: "${isUnderAPI ? apiPrefix : ""}$endpoint",
//         queryParameters: queryParam);
//     try {
//       if (isFormData) {
//         var request = http.MultipartRequest("POST", uri);
//         if (token != null) {
//           request.headers.addAll({
//             'Authorization': 'Bearer $token',
//           });
//         }
//         body!.forEach((key, value) {
//           request.fields[key] = value;
//         });
//         var responseStream = await request.send();
//         response = await http.Response.fromStream(responseStream);
//       } else {
//         response = await http.post(
//           uri,
//           body: encodeBody ? jsonEncode(body) : body,
//           headers: <String, String>{
//             ...headers,
//             'Content-Type': isFormData
//                 ? 'multipart/form-data'
//                 : !encodeBody
//                     ? 'application/x-www-form-urlencoded'
//                     : 'application/json',
//             'Accept': 'application/json',
//             if (token != null || authorization != null)
//               'Authorization': authorization != null
//                   ? 'Basic $authorization'
//                   : 'Bearer $token',
//           },
//         ).timeout(timeoutDuration);
//       }
//       responseJson = await verifyResponse(
//           response: response,
//           attempt: attempt,
//           callback: () => post(
//               endpoint: endpoint,
//               headers: headers,
//               queryParam: queryParam,
//               body: body,
//               authorization: authorization,
//               externalHost: externalHost,
//               withLoadingAlert: withLoadingAlert,
//               isUnderAPI: isUnderAPI,
//               isFormData: isFormData,
//               encodeBody: encodeBody,
//               attempt: attempt + 1));
//     } catch (exception) {
//       catchException(exception);
//     }
//     if (withLoadingAlert && EasyLoading.isShow) {
//       await EasyLoading.dismiss();
//     }
//     return responseJson;
//   }
//
//   Future<dynamic> delete(
//       {required String endpoint,
//       String? externalHost,
//       bool isUnderAPI = true,
//       Map<String, String>? queryParam,
//       Map<String, String>? headers,
//       bool withLoadingAlert = true,
//       int attempt = 0}) async {
//     String? token = AuthService.access?.token;
//
//     dynamic responseJson;
//     if (withLoadingAlert && !EasyLoading.isShow) {
//       await EasyLoading.show(
//         maskType: EasyLoadingMaskType.black,
//       );
//     }
//
//     try {
//       final response = await http
//           .delete(
//             Uri(
//                 scheme: 'http',
//                 host: externalHost ?? host,
//                 port: port,
//                 path: "${isUnderAPI ? apiPrefix : ""}$endpoint",
//                 queryParameters: queryParam),
//             headers: headers ??
//                 <String, String>{
//                   'Content-Type': 'application/json',
//                   'Accept': 'application/json',
//                   if (token != null) 'Authorization': 'Bearer $token',
//                 },
//           )
//           .timeout(timeoutDuration);
//       responseJson = await verifyResponse(
//           response: response,
//           attempt: attempt,
//           callback: () => delete(
//               endpoint: endpoint,
//               headers: headers,
//               queryParam: queryParam,
//               isUnderAPI: isUnderAPI,
//               externalHost: externalHost,
//               withLoadingAlert: withLoadingAlert,
//               attempt: attempt + 1));
//     } catch (exception) {
//       catchException(exception);
//     }
//     if (withLoadingAlert && EasyLoading.isShow) {
//       await EasyLoading.dismiss();
//     }
//     return responseJson;
//   }
//
//   Future<Map<String, dynamic>?> patch(
//       {required String endpoint,
//       required Map<String, dynamic>? body,
//       bool encodeBody = true,
//       String? externalHost,
//       port: port,
//       Map<String, String>? headers,
//       Map<String, String>? queryParam,
//       bool isUnderAPI = true,
//       bool withLoadingAlert = true,
//       bool isFormData = false,
//       int attempt = 0}) async {
//     String? token = AuthService.access?.token;
//     dynamic responseJson;
//     dynamic response;
//     if (withLoadingAlert && !EasyLoading.isShow) {
//       await EasyLoading.show(
//         maskType: EasyLoadingMaskType.black,
//       );
//     }
//     Uri uri = Uri(
//         scheme: 'http',
//         host: externalHost ?? host,
//         path: "${isUnderAPI ? apiPrefix : ""}$endpoint",
//         queryParameters: queryParam);
//     try {
//       if (isFormData) {
//         var request = http.MultipartRequest("PATCH", uri);
//         if (token != null) {
//           request.headers.addAll({
//             'Authorization': 'Bearer $token',
//           });
//         }
//         body!.forEach((key, value) {
//           request.fields[key] = value;
//         });
//         var responseStream = await request.send();
//         response = await http.Response.fromStream(responseStream);
//       } else {
//         response = await http
//             .patch(
//               uri,
//               body: encodeBody ? jsonEncode(body) : body,
//               headers: headers ??
//                   <String, String>{
//                     'Content-Type': isFormData
//                         ? 'multipart/form-data'
//                         : !encodeBody
//                             ? 'application/x-www-form-urlencoded'
//                             : 'application/json',
//                     'Accept': 'application/json',
//                     if (token != null) 'Authorization': 'Bearer $token',
//                   },
//               encoding: encodeBody ? null : Encoding.getByName("utf-8"),
//             )
//             .timeout(timeoutDuration);
//       }
//       responseJson = await verifyResponse(
//           response: response,
//           attempt: attempt,
//           callback: () => patch(
//               endpoint: endpoint,
//               headers: headers,
//               queryParam: queryParam,
//               body: body,
//               encodeBody: encodeBody,
//               externalHost: externalHost,
//               withLoadingAlert: withLoadingAlert,
//               isUnderAPI: isUnderAPI,
//               isFormData: isFormData,
//               attempt: attempt + 1));
//     } catch (exception) {
//       catchException(exception);
//     }
//     if (withLoadingAlert && EasyLoading.isShow) {
//       await EasyLoading.dismiss();
//     }
//     return responseJson;
//   }
//
//   Future<Map<String, dynamic>?> verifyResponse({
//     required http.Response response,
//     required int attempt,
//     required dynamic callback,
//   }) async {
//     Map<String, dynamic>? data = json.decode(response.body.toString());
//     log("[${response.statusCode}] \n${response.request} \n${response.body}");
//     switch (response.statusCode) {
//       case 401:
//         if (data != null && data["message"] != null) {
//           AuthService authService = AuthService();
//           if (attempt < 3 &&
//               data["message"] is String &&
//               data["message"].contains("jwt")) {
//             bool refreshed = await authService.refreshToken();
//             if (refreshed) {
//               return await callback.call();
//             }
//           }
//
//           showAlertDialog(
//               title: data["message"],
//               onClose: () {
//                 if (Get.currentRoute != Routes.HOME) {
//                   authService.logout();
//                   Get.offAllNamed(Routes.HOME);
//                 }
//               });
//         }
//         return null;
//       case 400:
//         if (data != null) {
//           if (data["message"] != null) {
//             showAlertDialog(
//               title: (data["message"])
//             );
//           }
//         }
//         return null;
//       case 403:
//         throw UnauthorisedException(response.body.toString());
//       case 500:
//         showAlertDialog(
//           subTitle: "internal-server-error".tr,
//         );
//         break;
//       case 502:
//         if (data != null && data["message"] != null) {
//           showAlertDialog(
//             title: data["message"],
//           );
//         }
//         break;
//       default:
//         if (data != null && data["errors"] != null) {
//           //todo
//           return null;
//         }
//         return data;
//     }
//     return null;
//   }
//
//   void catchException(exception) {
//     log(exception.toString());
//     if (exception is UnauthorisedException) {
//       log("*Exception: UnauthorisedException");
//     } else if (exception is http.ClientException ||
//         exception is SocketException ||
//         exception is TimeoutException) {
//       log("*Exception: ClientException SocketException TimeoutException");
//       showAlertDialog(
//           title: "you-are-offline".tr,
//           onClose: () => Get.offAllNamed(Routes.LOGIN),
//           iconSvg: "assets/icons/offline_internet.svg",);
//     } else {
//       log("*Exception: Server");
//     }
//   }
// }

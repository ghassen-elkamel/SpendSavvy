import '../../core/utils/constant.dart';
import '../../data/providers/api_provider.dart';
import '../../data/providers/storage_provider.dart';
import '../models/access_user.dart';
import '../models/app_auth.dart';
import '../models/entities/user.dart';

class AuthService {
  static bool isAuthenticated = false;
  static AccessUser? access;

  Future<bool> customerAuth({required AppAuth auth}) async {
    final response = await ApiProvider().post(HttpParamsPostPut(
      isUnderAPI: false,
      endpoint: "/auth/login",
      encodeBody: false,
      body: auth.toJson(),
    ));

    if (response != null && response["accessToken"] != null) {
      StorageHelper storage = StorageHelper();
      access = AccessUser(
        refreshToken: response["refreshToken"],
        accessToken: response["accessToken"],
      );

      storage.saveItem(storageAccessUser, access?.toJson());
      storage.saveItem("image", response["fileName"]);
      isAuthenticated = true;
    }
    return isAuthenticated;
  }

  Future<bool> refreshToken() async {
    StorageHelper storage = StorageHelper();
    final response = await ApiProvider().get(HttpParamsGetDelete(
      authorization: "Bearer ${access?.refreshToken}",
      endpoint: "/auth/refresh",
    ));
    if (response != null &&
        response["refreshToken"] != null &&
        response["accessToken"] != null) {
      access = AccessUser.fromJson(response);

      storage.saveItem(storageAccessUser, access?.toJson());

      isAuthenticated = true;
    }
    return isAuthenticated;
  }

  logout() {
    StorageHelper storage = StorageHelper();
    storage.removeItem(storageAccessUser);
    access = AccessUser();
    isAuthenticated = false;
  }

  Future<void> isAppLoggedIn() async {
    StorageHelper storage = StorageHelper();
    access = AccessUser.fromJson(await storage.fetchItem(storageAccessUser));
    isAuthenticated = access?.accessToken != null;
  }

  register({required User newUser}) async {

    final response = await ApiProvider().post(HttpParamsPostPut(
      isUnderAPI: false,
      endpoint: "/auth/register",
      encodeBody: false,
      body: newUser.toJson(),
    ));
    print(response);
    if (response != null) {

      return response;
    }
    return null;
  }
}

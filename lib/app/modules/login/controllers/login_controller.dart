import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/utils/helpers.dart';
import '../../../data/models/app_auth.dart';
import '../../../data/services/auth_service.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void login() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      showAtomSnackBar(
        title: "Error",
        message: "Please fill all fields",
        isSucceed: false,
      );
      return;
    }
    AppAuth auth = AppAuth(
      mail: emailController.text,
      password: passwordController.text,
    );
    bool isAuth = await AuthService().customerAuth(auth: auth);
    if (isAuth) {
      Get.offAllNamed(Routes.HOME);
    } else {
      showAtomSnackBar(
        title: "Error",
        message: "Invalid email or password",
        isSucceed: false,
      );
    }
  }

}

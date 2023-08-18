import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spend_savvy/app/data/services/auth_service.dart';

import '../../../data/models/entities/user.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthService authService = AuthService();

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

  register() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        userNameController.text.isEmpty) {
      Get.showSnackbar(
        const GetSnackBar(
          title: "Error",
          message: "Please fill all fields",
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      User user = User(
        mail: emailController.text,
        password: passwordController.text,
        userName: userNameController.text,
      );
      var response = await authService.register(newUser: user);
      if (response != null ) {
        Get.showSnackbar(
          const GetSnackBar(
            title: "Success",
            message: "Registered Successfully",
            duration: Duration(seconds: 2),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        Get.showSnackbar(
          GetBar(
            title: "Error",
            message: "Something went wrong",
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
          ),
        );
      }
      await Future.delayed(const Duration(seconds: 2));
      Get.back();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spend_savvy/app/core/values/colors.dart';
import 'package:spend_savvy/app/global_widgets/atom_text_field.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: SingleChildScrollView(
          primary: true,
          reverse: true,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 130.0, top: 180),
                child: Text('MoneySavvy',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: white)),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: Get.height * 0.6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.lerp(
                      const Radius.circular(80.0),
                      Radius.zero,
                      0.0,
                    )!,
                  ),
                  color: white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(28.0),
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                      child: AtomTextField(
                        labelText: 'Email',
                        controller: controller.emailController,
                        borderRadius: 10,
                        borderColor: primaryColor,
                        labelStyle: const TextStyle(color: primaryColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: AtomTextField(
                        labelText: 'Password',
                        controller: controller.passwordController,
                        borderRadius: 10,
                        borderColor: primaryColor,
                        labelStyle: const TextStyle(color: primaryColor),
                        isObscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80.0),
                      child: ElevatedButton(
                        onPressed: () {
                          controller.login();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          backgroundColor: primaryColor,
                          maximumSize: const Size(200, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: white,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        foregroundColor: primaryColor,
                      ),
                      child: const Text('register'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

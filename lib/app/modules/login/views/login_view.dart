import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spend_savvy/app/core/values/colors.dart';
import 'package:spend_savvy/app/global_widgets/atom_text_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
    gradient: const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryColor, neutralColor],
    ),),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('MoneySavvy', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Form(
                onWillPop: () async => false,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child:AtomTextField(
                        labelText: 'Email',

                     //   controller: controller.emailController,
                        onChanged: (value) {},
                        borderRadius: 10,
                        borderColor: primaryColor,
                      ),

                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child:AtomTextField(
                        labelText: 'Password',

                        //controller: controller.passwordController,
                        onChanged: (value) {},
                        borderRadius: 10,
                        borderColor: primaryColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(

                        padding: const EdgeInsets.symmetric(horizontal: 50),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        foregroundColor: Colors.white, backgroundColor: primaryColor,
                      ),
                      child: const Text('Login'),
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

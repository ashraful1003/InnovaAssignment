import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innova_assign/controller/login_controller.dart';
import 'package:innova_assign/view/home/home_screen.dart';
import 'package:innova_assign/view/login/custom_text_field.dart';

import '../utils/gesture_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 4,
                  margin: const EdgeInsets.only(left: 20),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("LOGIN",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text("Please Enter Information",
                          style: TextStyle(fontSize: 18, color: Colors.white))
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4 * 3 - 24,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                          controller: emailLoginController,
                          fieldIcon: Icons.email,
                          fieldLabelText: "Email"),
                      SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                          controller: passwordLoginController,
                          fieldIcon: Icons.lock,
                          fieldLabelText: "Password",
                          isObscure: true),
                      const SizedBox(height: 40),
                      GestureButton(
                          btnText: 'login',
                          email: emailLoginController.text,
                          password: passwordLoginController.text),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

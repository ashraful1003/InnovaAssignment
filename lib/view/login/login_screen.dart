import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innova_assign/controller/login_controller.dart';
import 'package:innova_assign/view/home/home_screen.dart';
import 'package:innova_assign/view/login/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find();
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
                          controller: loginController.emailLoginController,
                          hintText: 'Enter Email',
                          labelText: 'Email',
                          icon: Icons.email_outlined,
                          textInputType: TextInputType.emailAddress),
                      CustomTextField(
                          controller: loginController.passwordLoginController,
                          hintText: 'Enter Password',
                          labelText: 'Password',
                          icon: Icons.lock_outline_rounded,
                          textInputType: TextInputType.visiblePassword),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          loginController.login();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blue,
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),
                      )
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

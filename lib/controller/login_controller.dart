import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:innova_assign/view/home/home_screen.dart';

import '../view/utils/constants.dart';

class LoginController extends GetxController {
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController passwordLoginController = TextEditingController();

  var isLoading = false.obs;

  Future<void> login() async {
    try {
      var myHeaders = {
        'Content-Type': 'application/json',
      };

      Uri apiUrl = Uri.parse('$APIROOT$LOGGIN');

      Map data = {
        'email': emailLoginController.text.toString(),
        'password': passwordLoginController.text.toString(),
      };

      String body = json.encode(data);

      return http.post(apiUrl, body: body, headers: myHeaders).then((value) {
        if (value.statusCode == 200) {
          final jsonData = json.decode(value.body);

          /// for further use
          String info = jsonData['token'];

          /// clear controllers
          emailLoginController.clear();
          passwordLoginController.clear();

          /// after successfully logged in user will direct to homepage
          Get.offAll(() => const HomeScreen());
          Get.snackbar("Successful!", 'Login Successful');
        } else if (value.statusCode == 400) {
          final jsonData = json.decode(value.body);
          String info = jsonData['error'];
          Get.snackbar("Error!", info);
        }
      });
    } on Exception catch (e) {
      // TODO
      Get.snackbar("Error Happened!", e.toString());
    }
  }
}

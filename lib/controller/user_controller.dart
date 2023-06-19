import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:innova_assign/model/user_model.dart';

import '../view/utils/constants.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  List<UserModel> users = [];
  Rx<List<UserModel>> rxUsers = Rx<List<UserModel>>([]);

  Future<void> fetchData() async {
    var myHeaders = {
      'Content-Type': 'application/json',
    };

    Uri apiUrl = Uri.parse('$APIROOT$USERS');

    return http.get(apiUrl, headers: myHeaders).then((value) {
      /// if the statuscode is 200 then I store the products from api
      if (value.statusCode == 200) {
        final jsonData = json.decode(value.body);
        for (var temp in jsonData['data']) {
          UserModel user = UserModel.fromJson(temp);
          users.add(user);
        }
        rxUsers.value = users;
        isLoading(true);
      } else {
        /// if any error due to statuscode
        Get.snackbar("Error StatusCode ${value.statusCode}",
            "Facing Difficulties Retrieving Data");
      }
    }).catchError((onError) {
      Get.snackbar("Wrong", "Something went wrong. ${onError.toString()}");
    });
  }

  Future<void> deleteUser(int id) async {
    var myHeaders = {
      'Content-Type': 'application/json',
    };

    Uri apiUrl = Uri.parse('$APIROOT$DELETE$id');

    return http.get(apiUrl, headers: myHeaders).then((value) {
      if (value.statusCode == 204) {
        Get.snackbar('Delete', 'Successfully Deleted User!');
      }
    }).catchError((onError) {
      Get.snackbar("Wrong", "Something went wrong. ${onError.toString()}");
    });
  }
}

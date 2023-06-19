import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:innova_assign/model/user_model.dart';
import 'package:innova_assign/view/home/home_screen.dart';

import '../view/utils/constants.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  RxBool isMore = false.obs;
  ScrollController scrollController = ScrollController();
  int page = 1;
  List<UserModel> users = [];
  Rx<List<UserModel>> rxUsers = Rx<List<UserModel>>([]);

  @override
  void onInit() {
    super.onInit();
    fetchData(1);
    scrollController;
  }

  /// for pagination
  void scrollListener() async {
    if (isMore.value) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      page += 1;
      isMore(true);
      await UserController().fetchData(page);
      isMore(false);
    }
    if (page == 3) {
      Get.snackbar("Finished", 'End of Users');
    }
  }

  Future<void> fetchData(int page) async {
    var myHeaders = {'Content-Type': 'application/json'};

    Uri apiUrl = Uri.parse('$APIROOT$USERS$page&per_page=6');

    return http.get(apiUrl, headers: myHeaders).then((value) {
      /// if the status code is 200 then I store the products from api
      if (value.statusCode == 200) {
        final jsonData = json.decode(value.body);
        for (var temp in jsonData['data']) {
          UserModel user = UserModel.fromJson(temp);
          users.add(user);
        }
        rxUsers.value = rxUsers.value + users;
        update(rxUsers.value);
        isLoading(true);
      } else {
        /// if any error due to status code
        Get.snackbar("Error StatusCode ${value.statusCode}",
            "Facing Difficulties Retrieving Data");
      }
      update(rxUsers.value);
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
      print(value.statusCode);
      if (value.statusCode == 200) {
        /// they did not sort the users after deletion completed!
        Get.off(() => HomeScreen());
        Get.snackbar('Delete', 'Successfully Deleted User!');
      }
    }).catchError((onError) {
      Get.snackbar("Wrong", "Something went wrong. ${onError.toString()}");
    });
  }
}

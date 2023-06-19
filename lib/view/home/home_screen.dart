import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innova_assign/controller/user_controller.dart';
import 'package:innova_assign/view/home/user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    userController.fetchData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          centerTitle: false,
          title: const Text(
            'User List',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Obx(() => SingleChildScrollView(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: userController.rxUsers.value.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: MediaQuery.of(context).size.height / 6,
                        crossAxisCount: 3,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5),
                    itemBuilder: (BuildContext context, int index) {
                      return UserCard(
                          user: userController.rxUsers.value[index]);
                    })))));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innova_assign/model/user_model.dart';
import 'package:innova_assign/view/details/details_screen.dart';
import 'package:innova_assign/view/details/user_poster.dart';

class UserCard extends StatelessWidget {
  UserCard({Key? key, required this.user}) : super(key: key);

  UserModel user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailsScreen(user: user));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.blue.shade50),
        child: Column(
          children: [
            Hero(
                tag: '${user.id}',
                child: UserPoster(size: 60, image: user.avatar)),
            Text(
              '${user.firstName} ${user.lastName}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

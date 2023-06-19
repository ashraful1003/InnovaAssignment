import 'package:flutter/material.dart';
import 'package:innova_assign/model/user_model.dart';
import 'package:innova_assign/view/details/user_poster.dart';

class UserCard extends StatelessWidget {
  UserCard({Key? key, required this.user}) : super(key: key);

  UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.blue.shade50),
      child: Column(
        children: [
          UserPoster(size: 60, image: user.avatar),
          Text(
            '${user.firstName} ${user.lastName}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

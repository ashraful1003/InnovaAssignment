import 'package:flutter/material.dart';
import 'package:innova_assign/model/user_model.dart';
import 'package:innova_assign/view/utils/gesture_button.dart';

import 'user_poster.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({Key? key, required this.user}) : super(key: key);

  UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          leading: IconButton(
            padding: const EdgeInsets.only(left: 20),
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text(
            'Details of ${user.firstName}',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(

            /// show details of the selected products
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Center(
                    //   child: Hero(
                    //     tag: '${product.id}',
                    //     child: ProductPoster(
                    //       size: MediaQuery.of(context).size,
                    //       image: product.image,
                    //     ),
                    //   ),
                    // ),

                    UserPoster(
                      size: MediaQuery.of(context).size.width * 0.7,
                      image: user.avatar,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        '${user.firstName} ${user.lastName}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Text(
                      '${user.id}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          user.email,
                          style: const TextStyle(color: Colors.grey),
                        )),
                    const SizedBox(height: 20),
                    GestureButton(btnText: 'delete'),
                  ])),
        ])));
  }
}

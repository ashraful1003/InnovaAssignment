import 'package:flutter/material.dart';

class UserPoster extends StatelessWidget {
  UserPoster({Key? key, required this.size, required this.image})
      : super(key: key);

  double size;
  String image;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            margin: const EdgeInsets.all(20),
            height: size,
            width: size,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(180),
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.fill))));
  }
}

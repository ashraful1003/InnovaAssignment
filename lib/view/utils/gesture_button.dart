import 'package:flutter/material.dart';
import 'package:innova_assign/controller/login_controller.dart';

class GestureButton extends StatelessWidget {
  GestureButton({Key? key, required this.btnText}) : super(key: key);

  String btnText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (btnText == 'login') {
            LoginController().login();
          } else if (btnText == '') {
            ///
          }
        },
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue,
            ),
            alignment: Alignment.center,
            child: Text(btnText.toUpperCase(),
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white))));
  }
}

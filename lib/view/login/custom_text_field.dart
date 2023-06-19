import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.controller,
    required this.fieldIcon,
    required this.fieldLabelText,
    this.isObscure = false,
  }) : super(key: key);

  TextEditingController controller;
  IconData fieldIcon;
  String fieldLabelText;
  bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        icon: Icon(fieldIcon),
        labelText: fieldLabelText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.labelText,
      required this.icon,
      required this.textInputType})
      : super(key: key);

  TextEditingController? controller;
  String? hintText, labelText;
  IconData? icon;
  TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(27, 90, 225, 0.30196078431372547),
                    blurRadius: 20,
                    offset: Offset(0, 5))
              ]),
          child: TextField(
            controller: controller,
            keyboardType: textInputType,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                hintText: hintText,
                labelText: "$labelText(*)",
                prefixIcon: Icon(icon),
                hintStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder()),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class MyTestField extends StatelessWidget {
  final String hintText;
  final bool? obsecureText;
  final TextEditingController? controller;
  const MyTestField({
    super.key,
    required this.hintText,
    this.obsecureText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecureText ?? false,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}

import 'package:flutter/material.dart';
class MyTextField extends StatelessWidget {
final String hintText;
final bool obscureText;
final TextEditingController controller;
MyTextField({@required this.hintText,  this.obscureText, this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
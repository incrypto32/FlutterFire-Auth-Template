import 'package:flutter/material.dart';
import 'package:neurodb/app/data/constants.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    Key key,
    @required this.icon,
    @required this.hintText,
    @required this.onChanged,
    this.validator,
    this.isPassword = false,
  }) : super(key: key);
  final Icon icon;
  final String hintText;
  final Function(String) onChanged;
  final bool isPassword;
  final String Function(String) validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecorationStyle,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextFormField(
        obscureText: isPassword,
        onChanged: onChanged,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          errorStyle: TextStyle(color: Colors.pink),
          prefixIcon: icon,
          hintText: hintText,
          hintStyle: kHintTextStyle,
        ),
      ),
    );
  }
}

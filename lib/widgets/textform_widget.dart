// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final double margin;

  const EmailField({Key? key, required this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: margin),
      child: TextFormField(
        enableSuggestions: true,
        validator: (value) {
          if (value!.isEmpty) {
            debugPrint("Lenght error");
            return ("Lenght error");
          }
        },
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: "Enter your Email Address",
          hintStyle: TextStyle(
            color: Color(0xFF999999),
            fontSize: 16,
          ),
        ),
      ),
      // child: ,
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _passwordVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: TextFormField(
        enableSuggestions: true,
        validator: (value) {
          if (value!.length < 6) {
            debugPrint("Lenght error");
            return ("Lenght error");
          }
        },
        textInputAction: TextInputAction.done,
        obscureText: _passwordVisibility,
        decoration: InputDecoration(
          suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  _passwordVisibility = !_passwordVisibility;
                });
              },
              child: Icon(
                _passwordVisibility ? Icons.visibility : Icons.visibility_off,
                color: Color(0xFF999999),
              )),
          hintText: "Enter your password",
          hintStyle: TextStyle(
            fontSize: 16,
            color: Color(0xFF999999),
          ),
        ),
      ),
    );
  }
}

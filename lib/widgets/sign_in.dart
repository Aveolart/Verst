// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:verst/LoginService/auth_service.dart';
import 'package:verst/widgets/textform_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    return Form(
      key: formkey,
      child: Column(
        children: [
          EmailField(
            margin: 25,
          ),
          PasswordField(),
          SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: () {
              print("object");
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password?",
                style: TextStyle(color: Color(0xFF999999)),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (formkey.currentState!.validate()) {
                debugPrint("Correct");
                // ScaffoldMessenger.of(context)
                //     .showSnackBar(
                //   SnackBar(
                //     content: Text("E no complete"),
                //   ),
                // );
              }
            },
            child: Container(
              height: 40,
              width: 280,
              decoration: BoxDecoration(
                  color: Color(0xFF006DE6),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Text(
                "Log In",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Flexible(
                child: Container(
                  height: 1,
                  color: Colors.grey.shade400,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'or sgin in with',
                  style: TextStyle(fontSize: 16, color: Color(0xFF999999)
                      // fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Flexible(
                child: Container(
                  height: 1,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),

          // ElevatedButton(
          //   style: ButtonStyle(),
          //   onPressed: () {},
          //   child: Text("Submit"),
          // ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Color(0xFF006DE6),
                  size: 50,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              GestureDetector(
                onTap: () {
                  AuthService().googleSignIN();
                },
                child: Image.asset(
                  "assets/google.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:verst/LoginService/auth_service.dart';
import 'package:verst/widgets/sign_in.dart';
import 'package:verst/widgets/sign_up.dart';
import 'package:verst/widgets/textform_widget.dart';

class LoginSceen extends StatefulWidget {
  const LoginSceen({Key? key}) : super(key: key);

  @override
  State<LoginSceen> createState() => _LoginSceenState();
}

class _LoginSceenState extends State<LoginSceen> with TickerProviderStateMixin {
  final _formkey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    // TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF3B9ABA),
                Color(0xFFCBEBF8),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                height: 180,
                width: 400,
                image: AssetImage("assets/Logo 1.png"),
                fit: BoxFit.contain,
              ),
              // Expanded(child: Container()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .65,
                // height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 113, 112, 112),
                      offset: const Offset(
                        3.0,
                        3.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),

                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border:
                              Border.all(color: Color(0xFFE1E1E1), width: 1),
                        ),
                        height: 45,
                        child: TabBar(
                          tabs: [
                            Text("Log In"),
                            Text("Sign Up"),
                          ],
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelColor: Color(0xFF006DE6),
                          unselectedLabelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          // controller: _tabController,
                          indicator: BoxDecoration(
                            color: Color(0xFF006DE6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        height: 385,
                        child: TabBarView(
                          // controller: _tabController,
                          children: [
                            Login(),
                            SignUp(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

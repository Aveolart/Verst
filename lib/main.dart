// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:verst/LoginService/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        // primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF006DE6),
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
              color: Color(0xFF000000),
              fontWeight: FontWeight.bold,
              fontSize: 19),
          color: Color(0xFFFFFFFF),
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home: LoginSceen(),
      // home: Home(),
      // home: Homepage(),
      home: AuthService().authState(),
    );
  }
}

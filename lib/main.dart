import 'package:finalproject/onbording.dart';
import 'package:finalproject/sign_up.dart';
import 'package:flutter/material.dart';
import  'package:finalproject/login.dart';
import  'package:finalproject/splash_screen.dart';
import  'package:finalproject/sign_up.dart';
import  'package:finalproject/home_page.dart';
import  'package:finalproject/profile_page.dart';
import  'package:finalproject/category.dart';
void main() {
  runApp(const MaterialApp(
home: splash_screen(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   splash_screen();


  }}
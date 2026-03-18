import 'package:animate_do/animate_do.dart';
import 'package:finalproject/home.dart';
import 'package:finalproject/onbording.dart';
import 'package:flutter/material.dart';

class  splash_screen extends StatefulWidget {
  const  splash_screen({super.key});

  @override
  State< splash_screen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State< splash_screen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>onbording()));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.deepPurpleAccent,
      body: Center(child: Row(mainAxisAlignment:MainAxisAlignment.center,
        children: [
        FadeInLeft(child:
              Image.asset('assets/image/bazer.png',width: 200,)

        ),
      ],),),
      
      
    );
  }
}
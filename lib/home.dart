import 'package:finalproject/login.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {

  home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        children: [
          SizedBox(height: 80,),
          Text("welcome"),IconButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()));
        }, icon: Icon(Icons.arrow_forward_outlined))],
      ),),

    );}}
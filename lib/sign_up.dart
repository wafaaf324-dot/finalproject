import 'package:finalproject/home_page.dart';
import 'package:finalproject/login.dart';
import 'package:flutter/material.dart';


class sign_up extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<sign_up> {
  String name="";
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()));
            }, icon: Icon(Icons.arrow_back)),
            SizedBox(height: 60),
            Text("Sign Up", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Text("Create account and choose favorite menu"),
            SizedBox(height: 30),
            TextFormField(
              decoration: const InputDecoration(labelText: "Full Name", border: OutlineInputBorder()),
              validator: (value) {
                if (value == null || value.isEmpty) return "رجاءً ادخلي الاسم";
                return null;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(labelText: "Full Name"),
              onChanged: (value) {
                name = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return    "try again";
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password", border: OutlineInputBorder()),
              validator: (value) {
                if (value == null || value.length < 6) return "الباسورد ضعيف (أقل من 6 أحرف)";
                return null;
              },
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>   home_page()),
                    );
                  } else {
                    print(" error try again");
                  }
                },
                child: Text("Register"),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>login()));
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "By clicking Register, you agree to our Terms and Data Policy.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}
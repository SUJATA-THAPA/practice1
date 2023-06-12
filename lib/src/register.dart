import 'package:flutter/material.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   TextEditingController emailcontroller=TextEditingController();
    TextEditingController passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Validation"),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SizedBox(
              height: 50,
              width: 450,
              child: TextField(
               controller: emailcontroller,
                decoration: InputDecoration(
                    hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            width: 450,
            child: TextField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                 hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),

           const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
             
            },
            child: const Text("sumbit"),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/helpers/auth%20_ui_helpers.dart';
import 'package:flutter_application_2/providers/auth_provider.dart';
import 'package:flutter_application_2/src/register.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main()async {
   WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Screennn(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Screennn extends StatefulWidget {
  const Screennn({super.key});

  @override
  State<Screennn> createState() => _ScreennnState();
}

class _ScreennnState extends State<Screennn> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Form Validation"),
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
            onPressed: () async {
              String email = emailcontroller.text.trim();
              String password = passwordcontroller.text.trim();
              if (AuthHelpers.checkUserInputs(
                email: email,
                password: password,
              )) {
                final res = await context
                    .read<AuthProvider>()
                    .login(email: email, password: password);
                if (res == "ok") {
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                    content: Text(res)));
              

                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("please enter all the details")));
              }
            },
            child: const Text("sumbit"),
          ),
        ],
      ),
    );
  }
}

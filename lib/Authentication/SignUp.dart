import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes/Authentication/Login.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final email = TextEditingController();
  final password = TextEditingController();

  //signup here
  void signUp() async {
    try {
      if (!email.text.contains('@gmail.com')) {
        throw Exception("Please enter a valid Gmail address.");
      }
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text, password: password.text);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.deepPurple,
          content: Text('SignedUp Successfully'),
          duration: Duration(seconds: 2),
        ),
      );

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Login()));
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Signup failed.Please enter a valid Gmail address.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          titleTextStyle: const TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 30,
              fontWeight: FontWeight.w600),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
          ),
          elevation: 20,
          shadowColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple.shade400,
          toolbarHeight: 100,
          title: const Text('Sign Up')),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: RadialGradient(colors: [
              Color(0xffe0c3fc),
              Color(0xffe0c3fc),
            ])),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Lottie.network(
                    "https://assets10.lottiefiles.com/packages/lf20_mjlh3hcy.json",
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: email,
                  decoration: InputDecoration(
                      hintText: "Please enter your email.",
                      prefixIcon: const Icon(Icons.mail),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(50)),
                        borderSide:
                        BorderSide(color: Colors.purple.shade700, width: 2),
                      )),
                  keyboardType: TextInputType.text,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      hintText: "Please enter your password.",
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(50)),
                        borderSide:
                        BorderSide(color: Colors.purple.shade700, width: 2),
                      )),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  obscuringCharacter: "*",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: signUp, child: const Text("Sign Up")),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap:() {
                    Navigator.push(context, MaterialPageRoute(builder:
                        (context) => const Login()));
                  },
                  child: const Text("Log In")),
            ],
          ),
        ),
      ),
    );
  }
}

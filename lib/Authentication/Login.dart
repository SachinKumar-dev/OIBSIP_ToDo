import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:notes/Authentication/Auth.dart';
import 'package:notes/Authentication/SignUp.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.deepPurple,
          ),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const Auth()),
            (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop(); // Close the progress dialog
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid credentials. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
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
          title: const Text('Log In')),
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
              ElevatedButton(onPressed: signIn, child: const Text("Log In")),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUp()));
                  },
                  child: const Text("Sign Up")),
            ],
          ),
        ),
      ),
    );
  }
}

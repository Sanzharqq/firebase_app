import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auther/components/my_button.dart';
import 'package:firebase_auther/components/my_textfield.dart';
import 'package:firebase_auther/components/square_tile.dart';
import 'package:firebase_auther/pages/home.dart';
import 'package:firebase_auther/pages/home_page.dart';
import 'package:firebase_auther/services/auth_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(message, style: const TextStyle(color: Colors.white)),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 3, 44),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Image.asset("lib/images/sapar.png", width: 230),
                SizedBox(height: 50),

                Text(
                  'Welcome back to Sapar :)',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                  ),
                ),

                const SizedBox(height: 25),

                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                InkWell(
                  onTap: () {
                    signUserIn(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 113, 17, 190),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 16, 146, 197),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(thickness: 0.5, color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                SquareTile(
                  onTap: () => AuthService().signInWithGoogle(context),
                  imagePath: 'lib/images/google.png',
                ),

                SizedBox(width: 25),

                const SizedBox(height: 50),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register mow',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

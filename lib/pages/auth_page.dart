import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auther/pages/home_page.dart';
import 'package:firebase_auther/pages/login_or_register_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Yoy have problem, solve your problem :)'),
            );
          }

          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}

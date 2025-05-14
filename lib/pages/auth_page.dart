import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auther/pages/home_page.dart';
import 'package:firebase_auther/pages/login_or_register_page.dart';
import 'package:firebase_auther/pages/login_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Состояние загрузки
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Обработка ошибок
          if (snapshot.hasError) {
            return Center(
              child: Text('Произошла ошибка. Пожалуйста, попробуйте снова.'),
            );
          }

          // Пользователь вошел в систему
          if (snapshot.hasData) {
            return HomePage();
          } else {
            // Пользователь НЕ вошел в систему
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}

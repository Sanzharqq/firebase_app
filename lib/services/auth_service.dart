import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auther/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AuthService {
  // Мы добавили context сюда:
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

        await FirebaseAuth.instance.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

        if (gUser == null) return;

        final GoogleSignInAuthentication gAuth = await gUser.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: gAuth.accessToken,
          idToken: gAuth.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } catch (e) {
      print("Ошибка входа: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Ошибка входа: $e')));
    }
  }
}

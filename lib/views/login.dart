import 'package:flutter/material.dart';
import 'package:freelancing_fyp/services/firebase_auth_methods.dart';
import 'package:freelancing_fyp/views/signup_email_password_screen.dart';
import 'package:provider/provider.dart';

import 'login_email_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EmailPasswordSignup(),
                  ),
                );
              },
              child: const Text('Email Sign-up'),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EmailPasswordLogin(),
                  ),
                );
              },
              child: const Text('Email Login'),
            ),
            OutlinedButton(
              onPressed: () {
                context.read<FirebaseAuthMethods>().signInWithGoogle(context);
              },
              child: const Text('Google Sign-up'),
            ),
          ],
        ),
      ),
    );
  }
}

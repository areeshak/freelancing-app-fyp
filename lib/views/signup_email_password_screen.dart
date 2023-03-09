import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:freelancing_fyp/views/login.dart';
import 'package:provider/provider.dart';

import '../services/firebase_auth_methods.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class EmailPasswordSignup extends StatefulWidget {
  const EmailPasswordSignup({Key? key}) : super(key: key);

  @override
  State<EmailPasswordSignup> createState() => _EmailPasswordSignupState();
}

class _EmailPasswordSignupState extends State<EmailPasswordSignup> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signUpUser() async {
    context.read<FirebaseAuthMethods>().signUpWithEmail(
          email: emailController.text,
          password: passwordController.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100,),
          Container(
            padding: const EdgeInsets.all(18.0),
            child: const Text(
              'Sign up',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(controller: emailController, labelText: 'Email'),
          CustomTextField(
            controller: passwordController,
            labelText: 'Password',
            obscureText: true,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(onTap: signUpUser, text: 'Sign up'),
          const SizedBox(
            height: 40,
          ),
          RichText(
            text: TextSpan(
              text: "Already have an account? ",
              style: const TextStyle(fontSize: 16, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                  text: 'Login',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                          const LoginScreen(),
                        ),
                      );
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

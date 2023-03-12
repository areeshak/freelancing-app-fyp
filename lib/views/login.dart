import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:freelancing_fyp/services/firebase_auth_methods.dart';
import 'package:freelancing_fyp/views/signup_email_password_screen.dart';
import 'package:freelancing_fyp/widgets/custom_button.dart';
import 'package:freelancing_fyp/widgets/custom_textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'changePasswordScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() {
    context.read<FirebaseAuthMethods>().loginWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade400,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.27,
              child: const Center(
                child: Text(
                  'Hello',
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.73,
              // color: Colors.blueGrey.shade400,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(18.0),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      controller: emailController, labelText: 'Email'),
                  CustomTextField(
                    controller: passwordController,
                    labelText: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: GestureDetector(
                        child: const Text('Forgot Password?'),
                       onTap: () {Navigator.of(context).push(
                         MaterialPageRoute(
                           builder: (context) =>
                           const ChangePasswordScreen(),
                         ),
                       );},
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(onTap: loginUser, text: 'Login'),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Signup',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const EmailPasswordSignup(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Row(
                    children: const [
                      Expanded(
                          child: Divider(
                        color: Colors.black38,
                        thickness: 1,
                      )),
                      Text("   OR   "),
                      Expanded(
                          child: Divider(
                        color: Colors.black38,
                        thickness: 1,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      context
                          .read<FirebaseAuthMethods>()
                          .signInWithGoogle(context);
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                    label: const Text('Continue with Google'),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

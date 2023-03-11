import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelancing_fyp/services/firebase_auth_methods.dart';
import 'package:freelancing_fyp/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool isVerified = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    isVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isVerified) {
     // context.read<FirebaseAuthMethods>().sendEmailVerification(context);
      timer = Timer.periodic(
        const Duration(seconds: 3),                                             //every 3 seconds it checks if user email is verfied
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });

    if (isVerified) timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<FirebaseAuthMethods>().user; //access user
    final check = user.providerData.first.providerId;

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.all(18.0),
            child: const Text(
              'User Profile',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 30,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: check == "google.com"
                    ? NetworkImage(user.photoURL!)
                    : const NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/1144/1144709.png'),
              ),
              const SizedBox(
                width: 40,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        user.displayName != null
                            ? user.displayName!
                            : "namemissing@emailuser.com",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Text(
                      user.email!,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          !user.emailVerified
              ? CustomButton(
                  onTap: () {
                    context
                        .read<FirebaseAuthMethods>()
                        .sendEmailVerification(context);
                  },
                  text: ('verify email'),
                )
              : const Text(
                  "Email Verified!",
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                onTap: () {
                  context.read<FirebaseAuthMethods>().signOut(context);
                },
                text: 'Sign out',
                sizeFactor: 0.4,
              ),
              // SizedBox(width: 20,),
              CustomButton(
                onTap: () {
                  context.read<FirebaseAuthMethods>().deleteAccount(context);
                },
                text: 'Delete Account',
                sizeFactor: 0.4,
                buttonColor: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:freelancing_fyp/services/firebase_auth_methods.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user; //access user

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (!user.emailVerified)
          OutlinedButton(
              onPressed: () {
                context
                    .read<FirebaseAuthMethods>()
                    .sendEmailVerification(context);
              },
              child: const Text('verify email'),
          ),
        OutlinedButton(
            onPressed: () {
              context
                  .read<FirebaseAuthMethods>()
                  .signOut(context);
            },
            child: const Text('sign out'),
        ),
        OutlinedButton(
          onPressed: () {
            context
                .read<FirebaseAuthMethods>()
                .deleteAccount(context);
          },
          child: const Text('delete account'),
        )
      ],
    ));
  }
}

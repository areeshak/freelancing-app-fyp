import 'package:flutter/material.dart';
import 'package:freelancing_fyp/services/firebase_auth_methods.dart';
import 'package:freelancing_fyp/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user; //access user
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
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                        ),
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

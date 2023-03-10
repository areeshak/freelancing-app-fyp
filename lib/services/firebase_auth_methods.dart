import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freelancing_fyp/views/login.dart';
import 'package:freelancing_fyp/views/userProfile.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../utils/showSnackBar.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  User get user => _auth.currentUser!; //get user

  //state persistence
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

//email sign up
  Future<void> signUpWithEmail({
//sign up with email function
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await sendEmailVerification(context);
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const UserProfileScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

//email verification
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

//email login
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const UserProfileScreen(),
        ),
      );
//       if (!_auth.currentUser!.emailVerified) {
//         await sendEmailVerification(context);
// //use navigator to push to a page or provider to restrict user
//       }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

//google sign in
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
//FirebaseAuth auth = FirebaseAuth.instance;
      final GoogleSignIn googleSignIn = GoogleSignIn();

      await googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
            const UserProfileScreen(),
          ),
        );

        // if (userCredential != null) {
        //   if (userCredential.additionalUserInfo!.isNewUser) {
        //     //new user task
        //   } else {
        //     //old user
        //   }
        // }
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

//sign out
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
     if(_auth.currentUser == null){
       await  Navigator.of(context).push(
         MaterialPageRoute(
           builder: (context) =>
           const LoginScreen(),
         ),
       );
     }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  //delete account
  Future<void> deleteAccount(BuildContext context) async {
    try {
      await _auth.currentUser!.delete();
      if(_auth.currentUser == null){
        await  Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
            const LoginScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
      // if an error of requires-recent-login is thrown, make sure to log
      // in user again and then delete account.
    }
  }
}

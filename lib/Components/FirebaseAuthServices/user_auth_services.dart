import 'package:boutiqueapp/Components/FirebaseAuthServices/firebase_funtions.dart';
import 'package:boutiqueapp/Routes/app_navigation.dart';
import 'package:boutiqueapp/Routes/app_navigation_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password, String name, BuildContext context) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _auth.currentUser!.updateDisplayName(name);
      await _auth.currentUser!.verifyBeforeUpdateEmail(email);
      await FirestoreServices.saveUser(name, email, credential.user!.uid);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registration Successful')));
      return credential.user;
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'weak-password') {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text('Password Provided is too weak')));
      // } else 
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Email Provided already Exists')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('You are Logged in')));
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No user Found with this Email')));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Incorrect email or password')));
      }
    }
    return null;
  }

 void signInWithGoogle(BuildContext context) async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);
        await _auth.signInWithCredential(credential);

        AppNavigation.pushAndKillAll(routeName: AppNavRoutes.homeScreen);
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Error occured: $e'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close'))
                ],
              ));
    }
  }

  void signUp(String email, String username, String password, BuildContext context) async {
    // User? user = 
    await signUpWithEmailAndPassword(
        email, password, username, context);
 
      print('User is succesfulyy created');

      AppNavigation.pushAndKillAll(routeName: AppNavRoutes.homeScreen);
  }

  void LogIn(String email, String password, BuildContext context) async {
    User? user = await signInWithEmailAndPassword(
        email, password, context);

    if (user != null) {
      print('User is succesfulyy signedIn');
      AppNavigation.pushAndKillAll(routeName: AppNavRoutes.homeScreen);
    } else {
      print('Some error happened');
    }
  }
}

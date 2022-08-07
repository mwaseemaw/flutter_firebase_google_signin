import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_sign_in/Pages/logged_in.dart';

import '../Authentication/google_sign_in.dart';
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            User? result = await GoogleSignInAuthClass().gSignIn();
            result != null ?
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LoggedIn()), (route) => false)
                : print(result);
          },
          child: const Text('Sign in with google'),
        ),
      ),
    );
  }
}

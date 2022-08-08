import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_sign_in/Pages/logged_in.dart';

import '../Authentication/google_sign_in.dart';
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(decoration: InputDecoration(hintText: 'Email'),),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
              child: TextField(decoration: InputDecoration(hintText: 'Password')),
            ),
            OutlinedButton(onPressed: (){}, child:const Text('Log In',textScaleFactor: 1.2,)),
            const Padding(
              padding:  EdgeInsets.symmetric(vertical: 15),
              child: Text('OR'),
            ),
            TextButton(
              onPressed: ()async{
                User? result = await GoogleSignInAuthClass().gSignIn();
                result != null ?
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LoggedIn()), (route) => false)
                    : print(result);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('lib/Assets/google.jpg',height: 30,),
                  const Text('Sign in with google',textScaleFactor: 1.2,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

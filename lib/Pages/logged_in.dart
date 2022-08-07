import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_sign_in/main.dart';

import '../Authentication/google_sign_in.dart';
class LoggedIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome: ${FirebaseAuth.instance.currentUser!.providerData[0].displayName}",textScaleFactor: 1.3,),
            Text("Email: \n"
                "${FirebaseAuth.instance.currentUser!.providerData[0].email}",textScaleFactor: 1.3,),
            ElevatedButton(
              onPressed: ()async{
                var result = await GoogleSignInAuthClass().gSignOut();
                result == null ?
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>MyApp()), (route) => false)
                    : print(result);
              },
              child: const Text('Sign Out'),
            )
          ],
        ),
      ),
    );
  }
}

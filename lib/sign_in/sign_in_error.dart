import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screen/first_screen.dart';
import '../screen/login_screen.dart';

class SignInError extends StatelessWidget {
  const SignInError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasData){
            return const FirstScreen();
          }
          else if(snapshot.hasError){
            return const Center(child: Text('Something Went Wrong'),);
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}

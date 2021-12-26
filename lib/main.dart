import 'package:flutter/material.dart';
import 'package:social_media_app/screens/sign_in_screen.dart';
import 'package:social_media_app/screens/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  // Create new branch. IOS and Android was building
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SignUpScreen(),
      routes: {
        //"Sign in screen" : (context) => SignInScreen(),
        SignInScreen.id : (context) => SignInScreen(),
        SignUpScreen.id : (context) => SignUpScreen(),
      },
    );
  }
}

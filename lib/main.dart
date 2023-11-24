import 'package:exam1/view/login_screen/login_screen.dart';
import 'package:exam1/view/places_screen/place_screen.dart';
import 'package:exam1/view/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

const savekey = 'userlogeed';
void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}


// create a tourism app ui with custom data ,passing data between screen
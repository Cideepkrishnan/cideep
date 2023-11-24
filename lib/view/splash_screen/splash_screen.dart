import 'package:exam1/main.dart';
import 'package:exam1/view/log_out/log_out.dart';
import 'package:exam1/view/login_screen/login_screen.dart';
import 'package:exam1/view/places_screen/place_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    checkUserLoged();
    Future.delayed(Duration(seconds: 2)).then((value) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var name = prefs.getString("name");
      if (name == null || name.isEmpty) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Logout(),
            ));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Tourism App",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }

  Future<void> checkUserLoged() async {
    final sharedpref = await SharedPreferences.getInstance();
    final userloged = await sharedpref.get(savekey);
    if (userloged == null || userloged == false) {
      gotologin();
    } else {
      splashwait();
    }
  }

  gotologin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  splashwait() async {
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => PlaceScreen())));
  }
}

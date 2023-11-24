import 'package:exam1/main.dart';
import 'package:exam1/view/log_out/log_out.dart';
import 'package:exam1/view/places_screen/place_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  Future<void> share(String name) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("name", name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 100,
            ),
            TextFormField(
              controller: namecontroller,
              decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ('required');
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: passcontroller,
              decoration: InputDecoration(
                  labelText: "password",
                  hintText: "enter the password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ('required');
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 5),
              child: InkWell(
                onTap: () {
                  checkLogin(context);
                  if (_formkey.currentState!.validate()) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => PlaceScreen()));
                    // checkLogin(context, 0);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15)),
                  height: 50,
                  child: Center(
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkLogin(BuildContext context) async {
    if (namecontroller.text == passcontroller.text) {
      final sharedpref = await SharedPreferences.getInstance();
      await sharedpref.setBool(savekey, true);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => PlaceScreen()));
    }
  }
}

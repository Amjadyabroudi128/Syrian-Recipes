import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syrian_recipes/screens/Registration_Screen.dart';

import '../components/RoundedButton.dart';
import '../constants.dart';
import 'Home_Screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/img.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding:EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            Text(
              'Login',
              style: const TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
            ),

            TextField (
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: kTextFieldDecoration.copyWith(hintText: 'enter your email')
            ),
            SizedBox(
              height: 40,

            ),
            TextField (
                obscureText: true,
                textAlign: TextAlign.center,
                controller: passwordController,
                decoration:kTextFieldDecoration.copyWith(hintText: 'enter your password')
            ),
            SizedBox(
              height: 24.0,

            ),
            RoundedButton(
              title: 'login',
              colour: Colors.lightBlueAccent,
              onPressed: () async {
               dynamic result = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text);
               print(result);

               Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HomeScreen())
                );
                setState(() {

                });
              },
            ),
            RoundedButton(title: 'not registered? register now',
                colour: Colors.lightBlueAccent,
              onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(RegistrationScreen.id,
                    (route) => false);
              }
            )
          ],
        ),

      ),

    );

  }
}
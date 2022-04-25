import 'package:flutter/material.dart';
import 'package:syrian_recipes/screens/Login_Screen.dart';
import '../components/RoundedButton.dart';
import '../constants.dart';
import 'Home_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'RegistrationScreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
 final emailController = TextEditingController();
 final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
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
              'Register',
              style: const TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField (
                textAlign: TextAlign.center,
                controller: emailController,
                decoration: kTextFieldDecoration.copyWith(hintText: 'enter your email'),
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
              title: 'Register',
              colour: Colors.lightBlueAccent,
              onPressed: () async {
                await FirebaseAuth.instance.createUserWithEmailAndPassword
                  (email: emailController.text,
                    password: passwordController.text);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HomeScreen())
                );
                setState(()   {
                });
              },
            ),


            RoundedButton(title: 'already registered? login',
                colour: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.id,
                          (route) => false);
                }
            )
          ],
        ),
      ),

    );

  }
}
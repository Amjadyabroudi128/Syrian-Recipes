import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'BottomNavBar.dart';
import 'Registration_Screen.dart';
import 'package:syrian_recipes/main.dart';
import 'package:syrian_recipes/screens/SideDrawer.dart';
import 'package:favorite_button/favorite_button.dart';
class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //User? user = FirebaseAuth.instance.currentUser;
   // FirebaseAuth.instance.signOut();
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavBar(),

        ),
      ),
    );
  }
}



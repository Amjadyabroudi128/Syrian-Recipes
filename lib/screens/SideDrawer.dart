import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syrian_recipes/admin_page.dart';
import 'package:syrian_recipes/screens/Home_Screen.dart';
import 'package:syrian_recipes/screens/Welcome_screen.dart';



class SideDrawer extends StatefulWidget {

  static String id = 'SideDrawer';
  @override
  _SideDrawerState createState() => _SideDrawerState();

}

class _SideDrawerState extends State<SideDrawer> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
      UserAccountsDrawerHeader(
      accountName: Text('Welcome',style: TextStyle(
        fontWeight: FontWeight.bold,

      ),),
      accountEmail: Text('${FirebaseAuth.instance.currentUser!.email}'),
      ),
          Container(
            height: 30.0,
          ),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.logout),
            onTap: () async {
              // await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => WelcomeScreen())
              );
              setState(() {
              });
            },
          ),
          ListTile(
            title: Text('Admin'),
            leading: Icon(Icons.man),
            onTap: ()  {
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => adminPage())
              );
              setState(() {
              });
            },
          ),
          ListTile(
            title: Text('home'),
            leading: Icon(Icons.home),
            onTap: ()  {
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => HomeScreen())
              );
              setState(() {
              });
            },
          ),
        ],
      ),

    );

  }
}


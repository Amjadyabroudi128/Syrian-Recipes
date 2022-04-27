import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syrian_recipes/screens/SideDrawer.dart';


import '../components/RoundedButton.dart';
import '../constants.dart';


class adminPage extends StatefulWidget {
  static String id = 'AdminPage';
  @override
  _adminPageState createState() => _adminPageState();
}

class _adminPageState extends State<adminPage> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'admin page';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        drawer: SideDrawer(),
        body: MyCustomForm(),
      ),
    );
  }
}
class MyCustomForm extends StatelessWidget {
  String description = "";
  String ingredients = "";
  String time = "";
  String how = "";
  String name = "";
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Text("name"),
                TextField(
                  onChanged: (value) {
                    name = value;
                  },
                ),
                const Text("description"),
                TextField(
                  onChanged: (value) {
                    description = value;
                  },

                ),
                const Text("how"),
                TextField(
                  onChanged: (value) {
                    how = value;
                  },
                ),
                const Text("time"),
                TextField(

                  onChanged: (value) {
                    time = value;
                  },
                ),
                const Text("ingredients"),
                TextField(
                  onChanged: (value) {
                    ingredients = value;
                  },
                ),
                TextButton(

                    onPressed: () async {
                      await db.collection("recipes").doc().set({
                        "description": description,
                        "how it is done": how,
                        "ingredients": ingredients,
                        "name": name,
                        "time to prepare": double.parse(time).toString()
                      });
                    },
                    child: const Text("submit"),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

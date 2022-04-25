import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syrian_recipes/screens/recipes_details.dart';
class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String description = "";
  String ingredients = "";
  String time = "";
  String how = "";
  String name = "";
  late String uploadid;
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('recipes').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Stack(
                children: <Widget>[

              ],
              );
            }

            return ListView(
              children: snapshot.data!.docs.map((document) {
                return Stack(
                  alignment: Alignment.center,
                  children: <Widget> [
                    GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                builder: (context) => recipesDetails(document: document),
                              ),
                            );
                          },
                      child: Container(
                        margin: EdgeInsets.all(7.0),
                        padding: EdgeInsets.all(8.0),
                        child: Image.network(document['image'],

                        ),
                      ),
                    ),
                    Text(document['name'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                       color: Colors.white
                      ),),
                    SizedBox(height: 20.0),
                  ],
                );

              }).toList(),
            );
          },
        ),
      ),
    );
  }
}


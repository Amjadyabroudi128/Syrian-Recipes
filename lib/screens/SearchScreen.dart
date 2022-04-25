import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syrian_recipes/screens/recipes_details.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'SearchScreen';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  CollectionReference _firebasefirestore =
  FirebaseFirestore.instance.collection('recipes');


  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Card(
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search), hintText: 'Search...'),
            onChanged: (val) {
              setState(() {
                name = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (name != "" && name != null)
            ? FirebaseFirestore.instance
            .collection('recipes')
            .where('name', isGreaterThanOrEqualTo: name)
            .where('name', isLessThan: name +'z')
            .snapshots()
            : FirebaseFirestore.instance.collection("recipes").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot data = snapshot.data!.docs[index];
              return Card(
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => recipesDetails(document: data),
                          ),
                        );
                      },
                      child: Image.network(
                        data['image'],
                        width: 150,
                        height: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      data['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

}



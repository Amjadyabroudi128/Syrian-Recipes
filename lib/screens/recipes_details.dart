import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:syrian_recipes/screens/recipes_details.dart';
class recipesDetails extends StatefulWidget {

  recipesDetails({@required this.document});
  final document;
  static String id = 'recipesDetails';

  @override
  State<recipesDetails> createState() => _recipesDetailsState();
}

class _recipesDetailsState extends State<recipesDetails> {
  bool _isliked = false;
  Future addToFavourite() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("users-favourite-items");
    return await _collectionRef
        .doc(currentUser?.email)
        .collection("items")
        .doc()
        .set({
      "name": widget.document["name"],
      "image": widget.document["image"],
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Details: ' + widget.document["name"]),
        ),
        body: Center(
          child: Card(
            child:  ListView(
              children: <Widget>[
                Image.network
                  (widget.document['image'],
                  height: 250.0,

                ),
                IconButton(icon: Icon(_isliked ? Icons.favorite : Icons.favorite_border),
                  color: _isliked ? Colors.red : Colors.black,
                  onPressed: () {
                    setState(() {
                      _isliked = !_isliked;
                      addToFavourite();

                    });
                  },
                ),
                Text("name: "+widget.document['name'], style: TextStyle(),
                ),
                SizedBox(height: 10.0),
                Text("description: "+widget.document['description']
                ),
                SizedBox(height: 20.0),
                Text ("how it is done: "
                    +widget.document['how it is done']),
                SizedBox(height: 10.0),

                Text('time:  '+widget.document['time to prepare']),
                SizedBox(height: 10.0),
                Text('Ingredient: '+widget.document['ingredients']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

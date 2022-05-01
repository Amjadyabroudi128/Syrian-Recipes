import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<String> favoriteDataList = [];
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('users-favourite-items')
              .doc(FirebaseAuth.instance.currentUser!.email)
              .collection('items')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('something bad '),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, index) {
                  DocumentSnapshot data = snapshot.data!.docs[index];
                  return Card(
                    child: Row(
                    children: [
                      Image.network(
                        data['image'],
                        width: 150,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                      Text(
                         data['name'],
                        style: const TextStyle(),
                      ),
                      SizedBox(width: 90.0,),
                      GestureDetector(
                        child: CircleAvatar(
                          child: Icon(Icons.favorite),
                        ),
                        onTap: (){
                          FirebaseFirestore.instance.collection('users-favourite-items')
                              .doc(FirebaseAuth.instance.currentUser!.email).collection('items').doc(data.id).delete();
                        },
                      ),

                    ],
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

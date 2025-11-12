import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:push_data_firestore/data/users.dart';
import 'package:push_data_firestore/styles/spacings.dart';
import 'package:dto/dto.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _description = [];
  late final FirestoreODM odm;

  @override
  void initState() {
    super.initState();
    odm = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Center(
          child: SizedBox(
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _description.map((e) => Text(e)).toList(),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton.extended(
              onPressed: deleteCollections,
              label: const Row(
                children: [
                  Icon(Icons.delete_forever),
                  SizedBox(width: kHorizontalPaddingS),
                  Text("Supprimer les données"),
                ],
              ),
            ),
            FloatingActionButton.extended(
              onPressed: () async {
                await authenticate();
                await addUsers();
              },
              label: const Row(
                children: [
                  Icon(Icons.published_with_changes),
                  SizedBox(width: kHorizontalPaddingS),
                  Text("Générer les données"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> deleteCollections() async {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

    final users = await db.users.get();
    for (final user in users) {
      await db.users(user.id).delete();
      setState(() {
        _description.insert(0, "Suppression de l'utilisateur ${user.id}");
      });
    }
  }

  Future<void> authenticate() async {
    for (var user in users) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: user.email, password: "123456789");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          setState(() {
            _description.insert(0, "L'utilisateur ${user.email} existe déjà");
          });
        }
      }
    }
  }

  Future<void> addUsers() async {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

    for (var user in users) {
      await db.users.insert(user);
      setState(() {
        _description.insert(0, "Ajout de l'utilisateur${user.id}");
      });
    }
  }
}

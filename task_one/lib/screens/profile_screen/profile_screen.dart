import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final String uid = _auth.currentUser?.uid ?? '';

    return Scaffold(
        body: StreamBuilder(
      stream: _firestore.collection('users').doc(uid).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("An error occurred"));
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Center(child: Text("User data not found"));
        }

        final userData = snapshot.data!;
        final String firstName = userData['name'] ?? '';
        final String address = userData['address'] ?? '';
        return Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60.0,
                child: Center(
                  child: Icon(Icons.person),
                ),
              ),
              ListTile(
                trailing:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                title: Text(
                  "$firstName",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                trailing:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                title: Text(
                  address,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}

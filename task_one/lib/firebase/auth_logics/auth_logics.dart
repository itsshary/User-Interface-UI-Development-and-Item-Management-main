import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:task_one/utils/routes/routes_name.dart';
import 'package:task_one/utils/utilis.dart';

class AuthLogics {
  final auth = FirebaseAuth.instance;
  static AuthLogics instance = AuthLogics();
  String id = DateTime.now().millisecondsSinceEpoch.toString();
  final firestore = FirebaseFirestore.instance;

  Future<void> loginFun(
      String email, String password, BuildContext context) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((val) {
        ToastMsg.toastMessage('Login Successfully');
      });
    } catch (e) {
      ToastMsg.toastMessage('Login Successfully');
    }
  }

  //signupfunction

  Future<void> signup(String name, String address, String email,
      String password, BuildContext context) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        firestore
            .collection("users")
            .doc(id)
            .set({'id': id, 'name': name, 'address': address})
            .then((value) {})
            .onError((error, stackTrace) {
              ToastMsg.toastMessage(error.toString());
            });
        ToastMsg.toastMessage('Login Successfully');
      });
    } catch (e) {
      ToastMsg.toastMessage(e.toString());
    }
  }

  //logout function

  void logout(BuildContext context) {
    auth.signOut().then((val) {
      Navigator.pushReplacementNamed(
        context,
        Routesname.login,
      );
    });
  }
}

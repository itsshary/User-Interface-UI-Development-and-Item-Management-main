import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_one/firebase/auth_logics/auth_logics.dart';
import 'package:task_one/screens/todo_screens/display_todo.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    setLoading(true);
    try {
      await AuthLogics.instance.loginFun(email, password, context);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const DisplayTodo()),
          (route) => false);
    } finally {
      setLoading(false);
    }
  }

  Future<void> signup(String name, String address, String email,
      String password, BuildContext context) async {
    setLoading(true);
    try {
      await AuthLogics.instance.signup(name, address, email, password, context);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const DisplayTodo()),
          (route) => false);
    } finally {
      setLoading(false);
    }
  }
}

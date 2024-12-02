import 'package:flutter/material.dart';
import 'package:task_one/firebase/cloud_firestore/firestore.dart';

class TodoProvider extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> addTodo(String todo) async {
    setLoading(true);
    try {
      await CloudFirestoreHelper.instance.uploadTodo(todo);
    } catch (e) {
      // Handle any error
      debugPrint('Error adding todo: $e');
    } finally {
      setLoading(false);
    }
  }
}

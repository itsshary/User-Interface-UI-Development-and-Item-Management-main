import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:task_one/utils/utilis.dart';

class CloudFirestoreHelper {
  static CloudFirestoreHelper instance = CloudFirestoreHelper();

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance.currentUser;

//show cureent date

  String id = DateTime.now().millisecondsSinceEpoch.toString();

  Future<void> uploadTodo(String title) async {
    final now = DateTime.now();
    final formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final formattedTime = DateFormat('HH:mm:ss').format(now);
    await firestore.collection("Todos").doc(id).set({
      'title': title,
      'id': id,
      'time': "$formattedDate ,$formattedTime"
    }).then((value) {
      ToastMsg.toastMessage("Todo added Successfully");
    }).onError((error, stackTrace) {
      ToastMsg.toastMessage(error.toString());
    });
  }

  Future<void> uploaduserdata(String name, String address) async {
    await firestore
        .collection("users")
        .doc(auth!.uid)
        .set({'id': auth!.uid, 'name': name, 'address': address})
        .then((value) {})
        .onError((error, stackTrace) {
          ToastMsg.toastMessage(error.toString());
        });
  }
  //fetchTodos from firebase
}
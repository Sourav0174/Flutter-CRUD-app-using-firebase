import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String, dynamic> addUserDetails) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc()
        .set(addUserDetails);
  }

  Future<QuerySnapshot> getthisUserInfo(String name) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .where("First Name", isEqualTo: name)
        .get();
  }

  Future<void> updateUserData(String userId, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update(data);
  }

  deleteUser(String s) {}
}

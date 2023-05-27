import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../Model/user_model.dart';

class UserController extends GetxController {
  late final CollectionReference usersRef =
      FirebaseFirestore.instance.collection('users');
  late final RxList<User> users = RxList<User>([]);
  late final RxBool isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    getUsers();
  }

  Future<void> getUsers() async {
    isLoading.value = true;
    final snapshot = await usersRef.get();
    final usersList = snapshot.docs
        .map((doc) => User.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
    users.value = usersList;
    isLoading.value = false;
  }

  Future<void> addUser(User user) async {
    await usersRef.add(user.toMap());
    getUsers();
  }

  Future<void> updateUser(User user) async {
    await usersRef.doc(user.id.toString()).update(user.toMap());
    getUsers();
  }

  Future<void> deleteUser(User user) async {
    await usersRef.doc(user.id.toString()).delete();
    getUsers();
  }
}

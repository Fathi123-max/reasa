import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:reasa/app/Model/chatmodel.dart';

class ChatController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<Message> _messages = <Message>[].obs;

  @override
  void onInit() {
    super.onInit();
    _fetchMessages();
  }

  void _fetchMessages() async {
    QuerySnapshot querySnapshot = await _firestore.collection('messages').get();
    _messages.clear();
    for (var doc in querySnapshot.docs) {
      _messages.add(Message.fromMap(doc.data() as Map<String, dynamic>));
    }
  }

  void sendMessage(Message message) async {
    await _firestore.collection('messages').add(message.toMap());
    _messages.add(message);
  }

  RxList<Message> get messages => _messages;
}

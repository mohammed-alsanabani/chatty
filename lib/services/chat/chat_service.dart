import 'package:chatty/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  // getting instance from firestore and auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // getting stream user
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // go through individual user
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  // send a message
  Future<void> sendMessage(String receiverID, message) async {
    // get current user info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();
    // create a new message
    MessageModel newMessage = MessageModel(
      senderEmail: currentUserEmail,
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
      senderID: currentUserID,
    );

    // construct chat room ID for 2 users ( sorted to ensure uniqueness)
    List<String> ids = [currentUserID, receiverID];
    ids.sort(); // ensure any 2 user have same id
    String chatRoomID = ids.join('_');

    // add to firebase
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  // get a message
  Stream<QuerySnapshot> getMessage(String userID, otherUserID) {
    // construct chat room ID for 2 users ( sorted to ensure uniqueness)
    List<String> ids = [userID, otherUserID];
    ids.sort(); // ensure any 2 user have same id
    String chatRoomID = ids.join('_');

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}

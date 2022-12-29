import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:security_project/model/user.dart';

import '../data.dart';
import '../model/message.dart';

class FirebaseApi {
  static Stream<List<User>> getUsers() async* {
    yield* FirebaseFirestore.instance
        .collection('users')
        .orderBy(UserField.lastMessageTime, descending: true)
        .snapshots()
        .map((data) {
      return data.docs.map((doc) {
        return User.fromMap(doc.data());
      }).toList();
    });
  }

  //   Stream<List<CardModel>> getCards() async* {
  //   yield* db.collection(Constance.singleton.cards).snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //       return CardModel.fromMap(doc.data());
  //     }).toList();
  //   });
  // }

  // static Stream<List<User>> getUsers() {
  //   return FirebaseFirestore.instance
  //       .collection('users')
  //       .orderBy(UserField.lastMessageTime, descending: true)
  //       .snapshots()
  //       .transform(Utils.transformer(User.fromJson) as StreamTransformer<
  //           QuerySnapshot<Map<String, dynamic>>, List<User>>);
  // }

  static Future uploadMessge(String idUser, String message) async {
    final refMessages =
        FirebaseFirestore.instance.collection('chats/$idUser/messages');
    final newMessage = Message(
        idUser: myId,
        urlAvatar: myUrl,
        userName: myUsername,
        message: message,
        createdAt: DateTime.now().millisecondsSinceEpoch);
    await refMessages.add(newMessage.toJson());
    final refUsers = FirebaseFirestore.instance.collection('users');
    await refUsers.doc(idUser).update(
        {UserField.lastMessageTime: DateTime.now().millisecondsSinceEpoch});
  }

  //   static Stream<List<User>> getUsers() async* {
  //   yield* FirebaseFirestore.instance
  //       .collection('users')
  //       .orderBy(UserField.lastMessageTime, descending: true)
  //       .snapshots()
  //     .map((data) {
  //   return data.docs.map((doc) {
  //     return User.fromMap(doc.data());
  //   }).toList();
  // });
  // }

  static Stream<List<Message>> getMessages(String idUser) async* {
    yield* FirebaseFirestore.instance
        .collection('chats/$idUser/messages')
        // .orderBy(MessageField.createdAt, descending: true)
        .snapshots()
        .map((data) {
      return data.docs.map((doc) {
        return Message.fromMap(doc.data());
      }).toList();
    });
  }

  // static Stream<List<Message>> getMessages(String idUser) =>

  static Future addRandomUsers(List<User> users) async {
    final refUsers = FirebaseFirestore.instance.collection('users');

    final allUsers = await refUsers.get();
    if (allUsers.size != 0) {
      return;
    } else {
      for (final user in users) {
        final userDoc = refUsers.doc();
        final newUser = user.copywith(idUser: userDoc.id);

        await userDoc.set(newUser.toJson());
      }
    }
  }
}

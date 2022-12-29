import 'package:flutter/material.dart';
import 'package:security_project/api/firebaseApi.dart';
import 'package:security_project/model/message.dart';

import '../data.dart';
import 'message_widget.dart';

class MessagesWidget extends StatelessWidget {
  final String idUser;

  const MessagesWidget({required this.idUser, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Message>>(
        stream: FirebaseApi.getMessages(idUser),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return buildText(
                    'Something went wrong, please try again later');
              } else {
                final messages = snapshot.data;

                return messages!.isEmpty
                    ? buildText('Say Hi...')
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        reverse: true,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          return MessageWidget(
                            message: message,
                            isMe: message.idUser == myId,
                          );
                        },
                      );
              }
          }
        }));
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 24),
        ),
      );
}
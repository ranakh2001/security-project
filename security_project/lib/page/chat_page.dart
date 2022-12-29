import 'package:flutter/material.dart';
import 'package:security_project/widget/messages_widget.dart';
import 'package:security_project/widget/new_message.dart';
import 'package:security_project/widget/profile_header.dart';

import '../model/user.dart';

class ChatPage extends StatefulWidget {
  final User user;
  const ChatPage({required this.user, Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPagesState();
}

class _ChatPagesState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
        child: Column(
          children: [
            ProfileHeaderWidget(name: widget.user.name),
            Expanded(child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )
              ),
              child: MessagesWidget(idUser: widget.user.idUser!),
            )),
              NewMessageWidget(idUser: widget.user.idUser!)
        ],),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:security_project/api/firebaseApi.dart';
import 'package:security_project/model/user.dart';
import '../widget/chat_body.dart';
import '../widget/chat_header.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ChatsApp")),
      backgroundColor: Colors.deepPurpleAccent,
      body: SafeArea(
          child: StreamBuilder<List<User>>(
        stream: FirebaseApi.getUsers(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                //print(snapshot.error);
                return buildText('Something went wrong try later');
              } else {
                final users = snapshot.data;

                if (users!.isEmpty) {
                  return buildText('User not found');
                } else {
                  return Column(
                    children: [
                      ChatHeaderWidget(users: users),
                      ChatBodyWidget(users: users)
                    ],
                  );
                }
              }
          }
        },
      )),
    );
  }

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      );
}

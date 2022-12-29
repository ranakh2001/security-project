import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:security_project/api/firebase_api.dart';
import 'package:security_project/page/chats_page.dart';

import 'users.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi.addRandomUsers(Users.initUsers);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chats',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const ChatsPage(),
    );
  }
}

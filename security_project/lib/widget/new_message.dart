import 'package:flutter/material.dart';
import 'package:security_project/api/firebase_api.dart';

class NewMessageWidget extends StatefulWidget {
  final String idUser;
  const NewMessageWidget({required this.idUser, Key? key}) : super(key: key);

  @override
  State<NewMessageWidget> createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  final _controller = TextEditingController();
  String message = '';

  void sendMessage() async {
    FocusScope.of(context).unfocus();
    await FirebaseApi.uploadMessge(widget.idUser, message);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Row(children: [
        Expanded(
          child: TextField(
            controller: _controller,
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                labelText: 'Type your message',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 0),
                  gapPadding: 10,
                  borderRadius: BorderRadius.circular(25),
                )),
            onChanged: ((value) => setState(() {
                  message = value;
                })),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: message.trim().isEmpty ? null : sendMessage,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.deepPurple),
            child: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:security_project/model/message.dart';

class MessageWidget extends StatelessWidget {
  final Message message;
  final bool isMe;

  const MessageWidget({required this.message, required this.isMe, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        if (!isMe)
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(message.urlAvatar),
          ),
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          constraints: const BoxConstraints(maxWidth: 140),
          decoration: BoxDecoration(
              color:
                  isMe ? Colors.grey : Theme.of(context).colorScheme.secondary,
              borderRadius: isMe
                  ? const BorderRadius.all(Radius.circular(12)).subtract(
                      const BorderRadius.only(bottomRight: Radius.circular(12)))
                  : const BorderRadius.all(Radius.circular(12)).subtract(
                      const BorderRadius.only(
                          bottomLeft: Radius.circular(12)))),
          child: buildMessage(),
        ),
      ],
    );
  }

  Widget buildMessage() => Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.message,
            style: TextStyle(color: isMe ? Colors.black : Colors.white),
            textAlign: isMe ? TextAlign.end : TextAlign.start,
          ),
        ],
      );
}

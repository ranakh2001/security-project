class MessageField {
  static const String createdAt = 'createdAt';
}

class Message {
  final String? idUser;
  final String? userName;
  final String urlAvatar;
  final String message;
  final int? createdAt;

  const Message({
    required this.idUser,
    required this.userName,
    required this.urlAvatar,
    required this.message,
    required this.createdAt,
  });

  static Message fromJson(Map<String, dynamic> json) => Message(
      idUser: json['idUser'],
      userName: json['username'],
      urlAvatar: json['urlAvatar'],
      message: json['Message'],
      createdAt: json['createdAt']);

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'userName': userName,
        'urlAvatar': urlAvatar,
        'message': message,
        'createdAt': createdAt
      };

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      idUser: map['idUser'],
      userName: map['userName'],
      urlAvatar: map['urlAvatar'],
      message: map['message'],
      createdAt: map['createdAt'],
    );
  }
}

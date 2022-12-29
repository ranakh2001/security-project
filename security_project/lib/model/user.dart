class UserField {
  static const String lastMessageTime = 'lastMessageTime';
}

class User {
  final String? idUser;
  final String name;
  final String urlAvatar;
  final int? lastMessageTime;

  const User({
    this.idUser,
    required this.name,
    required this.urlAvatar,
    required this.lastMessageTime,
  });

  User copywith({
    String? idUser,
    String? name,
    String? urlAvatar,
    String? lastMessageTime,
  }) =>
      User(
          idUser: idUser ?? this.idUser,
          name: name ?? this.name,
          urlAvatar: urlAvatar ?? this.urlAvatar,
          lastMessageTime: this.lastMessageTime);

  static User fromJson(Map<String, dynamic> json) => User(
      idUser: json['idUser'],
      name: json['name'],
      urlAvatar: json['urlAvatar'],
      lastMessageTime: json['lastMessageTime']);

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      idUser: map['idUser'],
      name: map['name'],
      urlAvatar: map['urlAvatar'],
      lastMessageTime: map['lastMessageTime'],
    );
  }

  Map<String, dynamic> toJson() => {
        'idUser': idUser,
        'name': name,
        'urlAvatar': urlAvatar,
        'lastMessaging': lastMessageTime,
      };
}

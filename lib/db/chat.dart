import 'package:isar/isar.dart';

part 'chat.g.dart';

@collection
class Chat {
  late Id id;
  late DateTime updateAt;
  final messages = IsarLinks<Message>();
}

@collection
class Message {
  Id id = Isar.autoIncrement;
  late int chatId;
  late DateTime createdAt;
  late String message;
}

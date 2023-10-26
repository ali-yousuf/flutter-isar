import 'package:flutter_isar/db/chat.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarDB {
  late Future<Isar> db;

  IsarDB() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
        [ChatSchema, MessageSchema],
        inspector: true,
        directory: dir.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> saveChat(Chat chat, Message message) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.chats.put(chat);
      await isar.messages.put(message);
      await chat.messages.save();
    });
  }

  Future<Chat?> getChat(int id) async {
    final isar = await db;
    return isar.chats.get(id);
  }

  Future<List<Chat>> getChatList() async {
    final isar = await db;
    return isar.chats.where().findAll();
  }

  Stream<List<Chat>> watchToChats() async* {
    final isar = await db;
    yield* isar.chats.where().watch();
  }
}

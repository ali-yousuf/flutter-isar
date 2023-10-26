import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_isar/db/chat.dart';
import 'package:flutter_isar/db/isar_db.dart';
import 'package:uuid/uuid.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.db}) : super(const ChatState());

  final IsarDB db;

  Future<void> onMessageSubmitted(String value) async {
    if (state.id != 0) {
      var chat = await db.getChat(state.id);
      final message = Message()
        ..chatId = state.id
        ..createdAt = DateTime.now()
        ..message = value;
      chat?.messages.add(message);
      db.saveChat(chat!, message);
      emit(state.copyWith(messages: List.of(state.messages)..add(value)));
    } else {
      final uuid = const Uuid().hashCode;
      final message = Message()
        ..chatId = uuid
        ..createdAt = DateTime.now()
        ..message = value;
      final chat = Chat()
        ..id = uuid
        ..updateAt = DateTime.now();
      chat.messages.add(message);
      db.saveChat(chat, message);
      emit(state.copyWith(id: chat.id, messages: [value]));
    }
  }
}

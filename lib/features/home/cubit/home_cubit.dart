import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_isar/db/isar_db.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.db}) : super(HomeState()) {
    chatStreamSubscription = db.watchToChats().listen((chatList) {
      final histories = chatList.map((chat) {
        final message = chat.messages.first;
        return HistoryModel(
          updateAt: chat.updateAt.toLocal().toString(),
          message: message.message,
        );
      }).toList();
      emit(HomeState(historyList: histories));
    });
  }

  final IsarDB db;

  late final StreamSubscription chatStreamSubscription;

  Future<void> getHistory() async {
    final chatList = await db.getChatList();
    final histories = chatList.map((chat) {
      final message = chat.messages.first;
      return HistoryModel(
        updateAt: chat.updateAt.toLocal().toString(),
        message: message.message,
      );
    }).toList();
    emit(HomeState(historyList: histories));
  }
}

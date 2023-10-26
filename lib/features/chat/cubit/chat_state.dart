part of 'chat_cubit.dart';

class ChatState extends Equatable {
  const ChatState({
    this.id = 0,
    this.messages = const [],
    this.chatModelList = const [],
  });

  final int id;
  final List<String> messages;
  final List<ChatModel> chatModelList;

  ChatState copyWith({
    int? id,
    List<String>? messages,
    List<ChatModel>? chatModelList,
  }) {
    return ChatState(
      id: id ?? this.id,
      messages: messages ?? this.messages,
      chatModelList: chatModelList ?? this.chatModelList,
    );
  }

  @override
  List<Object?> get props => [id, messages, chatModelList];
}

class ChatModel {
  final List<String> messages;

  ChatModel({this.messages = const []});
}

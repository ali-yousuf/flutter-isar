import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_isar/features/chat/cubit/chat_cubit.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, this.id});

  final int? id;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();

    return Scaffold(
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          return state.messages.isEmpty
              ? const SizedBox()
              : ListView.builder(
                  itemCount: state.messages.length,
                  itemBuilder: (context, index) {
                    final message = state.messages[index];
                    return Text(message);
                  });
        },
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter your message',
          ),
          onSubmitted: (value) => cubit.onMessageSubmitted(value),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_isar/features/home/cubit/home_cubit.dart';
import 'package:flutter_isar/features/home/home_page.dart';
import 'package:flutter_isar/main.dart';

class FlutterIsarApp extends StatelessWidget {
  const FlutterIsarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => HomeCubit(db: isarDB)..getHistory(),
        child: const MyHomePage(),
      ),
    );
  }
}
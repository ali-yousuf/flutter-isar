import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_isar/app.dart';
import 'package:flutter_isar/app_bloc_observer.dart';
import 'package:flutter_isar/db/isar_db.dart';



late IsarDB isarDB;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  isarDB = IsarDB();
  Bloc.observer = AppBlocObserver();
  runApp(const FlutterIsarApp());
}

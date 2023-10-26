part of 'home_cubit.dart';

class HomeState {
  HomeState({this.historyList = const []});

  final List<HistoryModel> historyList;
}

class HistoryModel {
  final String updateAt;
  final String message;

  HistoryModel({this.updateAt = "", this.message = ""});
}

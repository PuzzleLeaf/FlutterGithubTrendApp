import 'package:flutter/material.dart';
import 'package:gitboard/models/repository_model.dart';
import 'package:gitboard/services/git_service.dart';
import 'package:gitboard/view_models/repository_view_model.dart';

class ChartListViewModel with ChangeNotifier {
  List<RepositoryViewModel> repositories;

  void trendingRepositories() async {
    List<RepositoryModel> result = await GitService().fetchTrendRepositories();
    repositories = result.map((data) => RepositoryViewModel(data)).toList();
    notifyListeners();
  }
}
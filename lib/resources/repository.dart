import 'package:gitboard/models/repository_model.dart';
import 'package:gitboard/resources/git_trend_api_provider.dart';

class Repository {
  final GitTrendApiProvider gitTrendApiProvider = GitTrendApiProvider();

  Future<List<RepositoryModel>> fetchTrendingRepositories() => gitTrendApiProvider.fetchTrendingRepositories();

  Future<List<RepositoryModel>> fetchTrendingLanguageRepositories(String language) => gitTrendApiProvider.fetchTrendingLanguageRepositories(language);

}
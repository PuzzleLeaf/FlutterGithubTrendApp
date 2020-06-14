import 'package:gitboard/resources/repository.dart';
import 'package:gitboard/view_models/repository_view_model.dart';
import 'package:rxdart/rxdart.dart';

class RepositoriesBloc {
  final _repository = Repository();
  final _trendingRepositoriesFetcher = BehaviorSubject<List<RepositoryViewModel>>();

  Stream<List<RepositoryViewModel>> get trendingRepositories => _trendingRepositoriesFetcher.stream;

  void fetchTrendingLanguageRepositories(String language) {
   _fetchTrendingRepositories(language, "", "");
  }

  void fetchTrendingSinceRepositories(String since) {
   _fetchTrendingRepositories("", since, "");
  }

  void fetchTrendingSpokenLanguageRepositories(String spokenLanguageCode) {
   _fetchTrendingRepositories("", "", spokenLanguageCode);
  }

  void _fetchTrendingRepositories(String language, String since, String spokenLanguageCode) async {
    var list = await _repository.fetchTrendingRepositories(language, since, spokenLanguageCode);
    _trendingRepositoriesFetcher.sink.add(list.map((data) => RepositoryViewModel(data)).toList());
  }

  dispose() async {
    await _trendingRepositoriesFetcher.drain();
    _trendingRepositoriesFetcher.close();
  }
}
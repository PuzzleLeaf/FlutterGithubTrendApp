import 'package:gitboard/models/chart_model.dart';
import 'package:gitboard/models/repository_model.dart';
import 'package:gitboard/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class RepositoriesBloc {
  final _repository = Repository();
  final _trendingRepositoriesFetcher =
      BehaviorSubject<Future<List<RepositoryModel>>>();

  Stream<Future<List<RepositoryModel>>> get trendingRepositories =>
      _trendingRepositoriesFetcher.stream;

  void fetchTrendingRepositories(ChartModel chartModel) {
    if (chartModel.type == 0) {
      _trendingRepositoriesFetcher.sink.add(_repository
          .fetchTrendingRepositories('', chartModel.since.toString().split('.').last, ''));
    }
  }

  dispose() async {
    await _trendingRepositoriesFetcher.drain();
    _trendingRepositoriesFetcher.close();
  }
}

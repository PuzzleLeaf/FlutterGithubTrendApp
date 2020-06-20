import 'package:gitboard/models/repository_model.dart';
import 'package:gitboard/models/repository_query_model.dart';
import 'package:gitboard/resources/repository.dart';
import 'package:gitboard/utils/constants.dart';
import 'package:rxdart/rxdart.dart';

class RepositoryQueryBloc {
  final _repository = Repository();

  final _repositoryQuery = BehaviorSubject<RepositoryQueryModel>();

  final _trendingRepositoriesFetcher =
      BehaviorSubject<Future<List<RepositoryModel>>>();

  Stream<Future<List<RepositoryModel>>> get trendingRepositories =>
      _trendingRepositoriesFetcher.stream;

  Stream<RepositoryQueryModel> get repositoryQuery => _repositoryQuery.stream;

  RepositoryQueryBloc() {
    _repositoryQuery.stream.transform(_queryTransformer()).pipe(_trendingRepositoriesFetcher);
  }

  void fetchRepositoryQuery(RepositoryQueryModel query) {
    _repositoryQuery.sink.add(query);
  }

  _queryTransformer() {
    return ScanStreamTransformer(
        (Future<List<RepositoryModel>> trendingRepositories, RepositoryQueryModel query, int index) {
          trendingRepositories = _repository.fetchTrendingRepositories(query.language.urlParam, Constants.sinceToString(query.since), '');
          return trendingRepositories;
        },
    );
  }

  dispose() async {
    await _repositoryQuery.drain();
    await _trendingRepositoriesFetcher.drain();
    _trendingRepositoriesFetcher.close();
    _repositoryQuery.close();
  }
}

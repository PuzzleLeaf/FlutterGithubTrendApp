import 'package:gitboard/resources/repository.dart';
import 'package:gitboard/view_models/repository_view_model.dart';
import 'package:rxdart/rxdart.dart';

class RepositoriesBloc {
  final _repository = Repository();
  final _trendingRepositoriesFetcher = PublishSubject<List<RepositoryViewModel>>();

  Stream<List<RepositoryViewModel>> get trendingRepositories => _trendingRepositoriesFetcher.stream;

  fetchTrendingRepositories() async {
    var list = await _repository.fetchTrendingRepositories();
    _trendingRepositoriesFetcher.sink.add(list.map((data) => RepositoryViewModel(data)).toList());
  }

  dispose() {
    _trendingRepositoriesFetcher.close();
  }
}

final bloc = RepositoriesBloc();
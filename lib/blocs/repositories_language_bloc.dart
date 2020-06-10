import 'package:gitboard/models/repository_model.dart';
import 'package:gitboard/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class RepositoriesLanguageBloc {
  final _repository = Repository();
  final _language = PublishSubject<String>();
  final _repositories = BehaviorSubject<Future<List<RepositoryModel>>>();

  Function(String) get fetchRepositoriesByLanguage => _language.sink.add;
  Stream<Future<List<RepositoryModel>>> get trendingRepositories => _repositories.stream;

  RepositoriesLanguageBloc() {
    _language.stream.transform(_languageTransformer()).pipe(_repositories);
  }

  dispose() async {
    _language.close();
    await _repositories.drain();
    _repositories.close();
  }

  _languageTransformer() {
    return ScanStreamTransformer(
      (Future<List<RepositoryModel>> repositories, String language, int index) {
        print(index);
        repositories = _repository.fetchTrendingLanguageRepositories(language);
        return repositories;
      }
    );
  }

}
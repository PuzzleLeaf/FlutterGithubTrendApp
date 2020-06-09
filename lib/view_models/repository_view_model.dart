import 'package:gitboard/models/repository_model.dart';

class RepositoryViewModel {
  RepositoryModel _repositoryModel;

  RepositoryViewModel(RepositoryModel repository) : _repositoryModel = repository;

  String get description {
    return _repositoryModel.description;
  }

  String get avatar {
    return _repositoryModel.avatar;
  }

  String get author {
    return _repositoryModel.author;
  }

  String get url {
    return _repositoryModel.url;
  }

  String get name {
    return _repositoryModel.name;
  }

  String get language {
    return _repositoryModel.language;
  }

  String get languageColor {
    return _repositoryModel.languageColor;
  }

  int get currentPeriodStars {
    return _repositoryModel.currentPeriodStars;
  }

  int get forks {
    return _repositoryModel.forks;
  }

  int get stars {
    return _repositoryModel.stars;
  }

}
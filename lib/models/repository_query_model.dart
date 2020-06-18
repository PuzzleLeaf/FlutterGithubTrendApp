import 'package:gitboard/models/repository_language_model.dart';

class RepositoryQueryModel {
  Since _since = Since.daily;
  RepositoryLanguageModel _language = RepositoryLanguageModel();

  set since(since) => _since = since;
  set language(language) => _language = language;

  RepositoryLanguageModel get language => _language;
  Since get since => _since;
}

enum Since {
  daily,
  weekly,
  monthly,
}
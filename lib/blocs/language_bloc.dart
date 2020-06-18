import 'package:rxdart/rxdart.dart';

class LanguageBloc {
  final _languageFetcher = BehaviorSubject<dynamic>();
  Stream<dynamic> get languages => _languageFetcher.stream;

  void fetchLanguage(dynamic language) {
    _languageFetcher.sink.add(language);
  }

  dispose() async {
    await _languageFetcher.drain();
    _languageFetcher.close();
  }
}

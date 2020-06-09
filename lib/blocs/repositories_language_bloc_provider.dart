import 'package:flutter/material.dart';
import 'package:gitboard/blocs/repositories_language_bloc.dart';

class RepositoriesLanguageBlocProvider extends InheritedWidget {
  final RepositoriesLanguageBloc bloc;

  RepositoriesLanguageBlocProvider() : bloc = RepositoriesLanguageBloc();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static RepositoriesLanguageBloc of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RepositoriesLanguageBlocProvider>(aspect: RepositoriesLanguageBlocProvider).bloc;
  }
}
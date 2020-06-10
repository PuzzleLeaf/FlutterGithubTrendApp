import 'package:flutter/material.dart';
import 'package:gitboard/blocs/repositories_language_bloc.dart';

class RepositoriesLanguageBlocProvider extends InheritedWidget {
  final RepositoriesLanguageBloc bloc;

  RepositoriesLanguageBlocProvider({Key key, Widget child}) : bloc = RepositoriesLanguageBloc(), super(key: key, child : child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static RepositoriesLanguageBlocProvider of (BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RepositoriesLanguageBlocProvider>();
  }

}
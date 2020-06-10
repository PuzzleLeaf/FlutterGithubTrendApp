import 'package:flutter/material.dart';
import 'package:gitboard/screens/chart_screen.dart';
import 'package:gitboard/view_models/chart_list_view_model.dart';
import 'package:provider/provider.dart';

import 'blocs/repositories_language_bloc_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gitboard',
      theme: ThemeData(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ChartListViewModel(),
          )
        ],
        child: RepositoriesLanguageBlocProvider(child: ChartScreen()),
      ),
    );
  }
}

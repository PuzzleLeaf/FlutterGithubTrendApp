import 'package:flutter/material.dart';
import 'package:gitboard/blocs/repositories_bloc.dart';
import 'package:gitboard/screens/chart_screen.dart';
import 'package:provider/provider.dart';

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
          Provider(
            create: (_) => RepositoriesBloc(),
          )
        ],
        child: ChartScreen(),
      ),
    );
  }
}

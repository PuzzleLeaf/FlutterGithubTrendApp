import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gitboard/models/repository_query_model.dart';
import 'package:gitboard/screens/chart_screen.dart';
import 'package:provider/provider.dart';

import 'blocs/repository_query_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gitboard',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0,
          brightness: Brightness.light,
          color: Colors.transparent,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black,
            )
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      home: MultiProvider(
        providers: [
          Provider(
            create: (_) => RepositoryQueryBloc(),
          ),
          Provider(
            create: (_) => RepositoryQueryModel(),
          )
        ],
        child: ChartScreen(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gitboard/blocs/repositories_language_bloc.dart';
import 'package:gitboard/blocs/repositories_language_bloc_provider.dart';
import 'package:gitboard/models/repository_model.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  RepositoriesLanguageBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = RepositoriesLanguageBlocProvider.of(context).bloc;
    bloc.fetchRepositoriesByLanguage('dart');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: bloc.trendingRepositories,
        builder: (BuildContext _,
            AsyncSnapshot<Future<List<RepositoryModel>>> snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder(
                future: snapshot.data,
                builder: (BuildContext __,
                    AsyncSnapshot<List<RepositoryModel>> itemSnapShot) {
                  if (itemSnapShot.hasData) {
                    return ListView.builder(
                      itemCount: itemSnapShot.data.length,
                      itemBuilder: (__, index) {
                        return Text(itemSnapShot.data[index].name);
                      },
                    );
                  }
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gitboard/blocs/repositories_bloc.dart';
import 'package:gitboard/view_models/repository_view_model.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  RepositoriesBloc bloc;

  @override
  void didChangeDependencies() {
    bloc = Provider.of<RepositoriesBloc>(context);
    bloc.fetchTrendingSpokenLanguageRepositories("ko");
    print('change');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  Color color = Colors.green;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder(
        stream: bloc.trendingRepositories,
        builder: (BuildContext _,
            AsyncSnapshot<List<RepositoryViewModel>> snapshot) {
          if (snapshot.hasData) {
            return InkWell(
              child: ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext __, int index) {
                  RepositoryViewModel vm = snapshot.data[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(vm.avatar),
                      title: Text(vm.name),
                      subtitle: InkWell(
                        onTap: () {
                          color = Colors.black;
                          setState(() {
                            
                          });
                        },
                        child: Text(vm.description,
                          style: TextStyle(
                            color: color,
                          ),
                    ),
                      ),)
                  );
                },
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

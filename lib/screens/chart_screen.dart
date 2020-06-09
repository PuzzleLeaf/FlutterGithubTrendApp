import 'package:flutter/material.dart';
import 'package:gitboard/blocs/repositories_bloc.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {

  @override
  void initState() {
    super.initState();
    bloc.fetchTrendingRepositories();
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
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (_, index) {
                return Text(snapshot.data[index].name);
              },
              itemCount: snapshot.data.length,
            );
          } else if (snapshot.hasError) {
            return Text("Error");
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

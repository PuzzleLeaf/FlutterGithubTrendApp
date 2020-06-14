import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
//    return StreamBuilder(
//      stream: bloc.trendingRepositories,
//      builder: (BuildContext _,
//          AsyncSnapshot<List<RepositoryViewModel>> snapshot) {
//        if (snapshot.hasData) {
//          return InkWell(
//            child: ListView.builder(
//              itemCount: snapshot.data.length,
//              itemBuilder: (BuildContext __, int index) {
//                RepositoryViewModel vm = snapshot.data[index];
//                return Card(
//                  child: ListTile(
//                    leading: Image.network(vm.avatar),
//                    title: Text(vm.name),
//                    subtitle: InkWell(
//                      onTap: () {
//                        color = Colors.black;
//                        setState(
//                              () {},
//                        );
//                      },
//                      child: Text(
//                        vm.description,
//                        style: TextStyle(
//                          color: color,
//                        ),
//                      ),
//                    ),
//                  ),
//                );
//              },
//            ),
//          );
//        } else {
//          return Container();
//        }
//      },
//    );
  }
}

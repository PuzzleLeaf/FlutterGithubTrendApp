import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitboard/blocs/repositories_bloc.dart';
import 'package:gitboard/models/chart_model.dart';
import 'package:gitboard/models/repository_model.dart';
import 'package:gitboard/widgets/chart_item.dart';
import 'package:gitboard/widgets/group_button.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  RepositoriesBloc bloc;
  ChartModel chartModel;

  @override
  void initState() {
    super.initState();
    chartModel = Provider.of<ChartModel>(context, listen: false);
    bloc = Provider.of<RepositoriesBloc>(context, listen: false);
    bloc.fetchTrendingRepositories(chartModel);
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  Widget _chartList(List<RepositoryModel> data) {
    return ListView.builder(
      padding: const EdgeInsets.all(0),
      itemCount: data.length,
      itemBuilder: (BuildContext _, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: ChartItem(
            rank: index + 1,
            data: data[index],
            width: ScreenUtil().setWidth(375),
            height: ScreenUtil().setWidth(120),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);

    return Scaffold(
      backgroundColor: Color(0xffF6F7FA),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
            height: ScreenUtil().setHeight(80),
            alignment: Alignment.center,
            child: Text(
              'Gitboard',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(40),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(25)),
            width: ScreenUtil().setWidth(280),
            height: ScreenUtil().setHeight(40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: GroupButton(
              onPressed: (val) {
                chartModel.since = val;
                bloc.fetchTrendingRepositories(chartModel);
              },
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: bloc.trendingRepositories,
              builder: (BuildContext context,
                  AsyncSnapshot<Future<List<RepositoryModel>>> s1) {
                if (s1.hasData) {
                  return FutureBuilder(
                    future: s1.data,
                    builder: (BuildContext _,
                        AsyncSnapshot<List<RepositoryModel>> s2) {
                      if (s2.connectionState == ConnectionState.done) {
                        if (s2.hasData) {
                          return _chartList(s2.data);
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

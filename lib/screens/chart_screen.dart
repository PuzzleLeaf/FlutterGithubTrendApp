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

  Widget _loadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);

    return Scaffold(
      backgroundColor: Color(0xfff6f7fa),
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
            width: ScreenUtil().setWidth(280),
            height: ScreenUtil().setHeight(40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: GroupButton(
              onPressed: (since) {
                chartModel.since = since;
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
                    builder: (BuildContext context,
                        AsyncSnapshot<List<RepositoryModel>> s2) {
                      if (s2.connectionState == ConnectionState.done) {
                        if (s2.hasData) {
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: s2.data.length,
                            itemBuilder: (BuildContext _, int index) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: ScreenUtil().setHeight(5),
                                  horizontal: ScreenUtil().setWidth(10),
                                ),
                                child: ChartItem(
                                  rank: index + 1,
                                  data: s2.data[index],
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: Text('Empty'),
                          );
                        }
                      } else {
                        return _loadingWidget();
                      }
                    },
                  );
                } else {
                  return _loadingWidget();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

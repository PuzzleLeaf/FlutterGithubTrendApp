import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitboard/blocs/repository_query_bloc.dart';
import 'package:gitboard/models/repository_model.dart';
import 'package:gitboard/models/repository_query_model.dart';
import 'package:gitboard/screens/repository_detail_screen.dart';
import 'package:gitboard/utils/constants.dart';
import 'package:gitboard/widgets/chart_item.dart';
import 'package:gitboard/widgets/group_button.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  RepositoryQueryBloc bloc;
  RepositoryQueryModel query;

  @override
  void initState() {
    super.initState();
    query = Provider.of<RepositoryQueryModel>(context, listen: false);
    bloc = Provider.of<RepositoryQueryBloc>(context, listen: false);
    bloc.fetchRepositoryQuery(query);
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
            margin: EdgeInsets.only(
              top: ScreenUtil().setHeight(50),
              bottom: ScreenUtil().setHeight(20),
            ),
            height: ScreenUtil().setHeight(80),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  right: 0,
                  child: PopupMenuButton(onSelected: (val) {
                    query.language = val;
                    bloc.fetchRepositoryQuery(query);
                  }, itemBuilder: (BuildContext _) {
                    return Constants.languages.map((language) {
                      return PopupMenuItem(
                        value: language,
                        child: Text(language.name),
                      );
                    }).toList();
                  }),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Gitboard',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(45),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: ScreenUtil().setWidth(100),
                  child: StreamBuilder(
                    stream: bloc.repositoryQuery,
                    builder: (BuildContext _,
                        AsyncSnapshot<RepositoryQueryModel> snapshot) {

                      Color color = Colors.black;
                      String lanaguage = "All";
                      if (snapshot.hasData) {
                        color = Constants.fromHex(snapshot.data.language.color);
                        lanaguage = snapshot.data.language.name;
                      }
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          lanaguage,
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(10),
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
            width: ScreenUtil().setWidth(280),
            height: ScreenUtil().setHeight(40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: GroupButton(
              onPressed: (since) {
                query.since = since;
                bloc.fetchRepositoryQuery(query);
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
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext __) {
                                    return RepositoryDetailScreen(
                                      data: s2.data[index],
                                    );
                                  }));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: ScreenUtil().setHeight(5),
                                    horizontal: ScreenUtil().setWidth(10),
                                  ),
                                  child: ChartItem(
                                    rank: index + 1,
                                    data: s2.data[index],
                                  ),
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

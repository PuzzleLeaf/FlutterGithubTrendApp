import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitboard/blocs/repositories_bloc.dart';
import 'package:gitboard/view_models/repository_view_model.dart';
import 'package:gitboard/widgets/chart_item.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  RepositoriesBloc bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    bloc = Provider.of<RepositoriesBloc>(context);
    bloc.fetchTrendingLanguageRepositories("dart");
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
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: false);

    return Scaffold(
      backgroundColor: Color(0xffF6F7FA),
      body: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(150),
            alignment: Alignment.center,
            child: Text(
              'Gitboard',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(40),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: bloc.trendingRepositories,
              builder: (BuildContext context,
                  AsyncSnapshot<List<RepositoryViewModel>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext _, int index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: ChartItem(
                          rank: index + 1,
                          data: snapshot.data[index],
                          width: ScreenUtil().setWidth(375),
                          height: ScreenUtil().setWidth(120),
                        ),
                      );
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

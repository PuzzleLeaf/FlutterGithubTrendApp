import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:gitboard/models/repository_model.dart';

class RepositoryDetailScreen extends StatelessWidget {
  final RepositoryModel data;

  const RepositoryDetailScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f7fa),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.star_border,
              size: ScreenUtil().setSp(15),
            ),
            Text(
              ' ${data.stars}',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(5),
            ),
            Icon(
              Icons.share,
              size: ScreenUtil().setSp(15),
            ),
            Text(
              ' ${data.forks}',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Text(data.languageColor),
          Text(data.name),
          Text(data.description),
          Text(data.url),
        ],
      ),
    );
  }
}

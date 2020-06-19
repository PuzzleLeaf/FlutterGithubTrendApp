import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitboard/models/repository_model.dart';
import 'package:gitboard/widgets/language_label.dart';

class ChartItem extends StatelessWidget {
  final int rank;
  final RepositoryModel data;

  const ChartItem({Key key, this.rank, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(375),
      height: ScreenUtil().setHeight(120),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '$rank',
                style: TextStyle(
                  color: Color(0xff3b3647),
                  fontSize: ScreenUtil().setSp(40),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LanguageLabel(
                  language: data.language,
                  color: data.languageColor,
                ),
                Text(
                  data.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  data.author,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(5),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star_border,
                      size: ScreenUtil().setSp(15),
                    ),
                    Text(
                      '${data.stars}',
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
                      '${data.forks}',
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
              child: ClipOval(
                child: Image.network(
                  '${data.avatar}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gitboard/utils/constants.dart';
import 'package:gitboard/view_models/repository_view_model.dart';

class ChartItem extends StatelessWidget {
  final int rank;
  final RepositoryViewModel data;
  final double width;
  final double height;

  const ChartItem({Key key, this.rank, this.data, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
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
                  color: Color(0xff3B3647),
                  fontSize: ScreenUtil().setSp(40),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Constants.fromHex(data.languageColor ?? '#000000'),
                  ),
                  child: Text(
                    data.language ?? 'Empty',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(10),
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  data.name,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  data.author,
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:gitboard/utils/constants.dart';

class LanguageLabel extends StatelessWidget {
  final String language;
  final String color;

  const LanguageLabel({Key key, this.language, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(5),
        vertical: ScreenUtil().setHeight(2),
      ),
      decoration: BoxDecoration(
        color: Constants.fromHex(color ?? '#000000'),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        language ?? 'All',
        style: TextStyle(
          fontSize: ScreenUtil().setSp(10),
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}

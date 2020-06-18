import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:gitboard/models/repository_query_model.dart';

class GroupButton extends StatefulWidget {
  final Function onPressed;

  const GroupButton({Key key, this.onPressed}) : super(key: key);

  @override
  _GroupButtonState createState() => _GroupButtonState();
}

class _GroupButtonState extends State<GroupButton> {
  int _selected = 0;
  Color _selectedColor = Color(0xff1d2440);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setHeight(40),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  _selected = 0;
                  widget.onPressed(Since.daily);
                });
              },
              color: _selected == 0 ? _selectedColor : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Daily',
                style: TextStyle(
                  color: _selected == 0 ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: ScreenUtil().setWidth(90),
          top: 0,
          child: Container(
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setHeight(40),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  _selected = 1;
                  widget.onPressed(Since.weekly);
                });
              },
              color: _selected == 1 ? _selectedColor : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Weekly',
                style: TextStyle(
                  color: _selected == 1 ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setHeight(40),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  _selected = 2;
                  widget.onPressed(Since.monthly);
                });
              },
              color: _selected == 2 ? _selectedColor : Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Monthly',
                style: TextStyle(
                  color: _selected == 2 ? Colors.white : Colors.grey,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

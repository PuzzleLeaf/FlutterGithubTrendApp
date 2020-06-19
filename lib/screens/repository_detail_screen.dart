import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:gitboard/models/repository_model.dart';
import 'package:gitboard/widgets/language_label.dart';
import 'package:url_launcher/url_launcher.dart';

class RepositoryDetailScreen extends StatelessWidget {
  final String since;
  final RepositoryModel data;

  const RepositoryDetailScreen({Key key, this.since, this.data})
      : super(key: key);

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff6f7fa),
      appBar: AppBar(
        title: Text(
          since.toUpperCase(),
          style: TextStyle(
            fontSize: ScreenUtil().setSp(15),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: ScreenUtil().setWidth(375),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(340),
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(5),
                  vertical: ScreenUtil().setHeight(10),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Image.network(
                        '${data.avatar}',
                        width: ScreenUtil().setWidth(100),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    LanguageLabel(
                      language: data.language,
                      color: data.languageColor,
                    ),
                    Text(
                      data.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data.author,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.star_border,
                          size: ScreenUtil().setSp(20),
                        ),
                        Text(
                          ' ${data.stars}',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(5),
                        ),
                        Icon(
                          Icons.share,
                          size: ScreenUtil().setSp(18),
                        ),
                        Text(
                          ' ${data.forks}',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Container(
                width: ScreenUtil().setWidth(340),
                height: ScreenUtil().setHeight(120),
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(5),
                  vertical: ScreenUtil().setHeight(10),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.builtBy.length,
                  itemBuilder: (BuildContext _, int index) {
                    var profile = data.builtBy[index];
                    return GestureDetector(
                      onTap: () {
                        _launchInBrowser(profile.href);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ClipOval(
                              child: Image.network(
                                '${profile.avatar}',
                                width: ScreenUtil().setWidth(60),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              profile.username,
                              style: TextStyle(
                                fontSize: ScreenUtil().setSp(12),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Container(
                width: ScreenUtil().setWidth(340),
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(20),
                  vertical: ScreenUtil().setHeight(20),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  data.description ?? 'Empty',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Container(
                width: ScreenUtil().setWidth(340),
                height: ScreenUtil().setHeight(150),
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(5),
                  vertical: ScreenUtil().setHeight(10),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: ScreenUtil().setHeight(80),
                    ),
                    Text(
                      'Current Period Stars',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: ScreenUtil().setSp(10),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "${data.currentPeriodStars}",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Container(
                width: ScreenUtil().setWidth(340),
                height: ScreenUtil().setHeight(120),
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(5),
                  vertical: ScreenUtil().setHeight(10),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _launchInBrowser(data.url);
                      },
                      child: Icon(
                        Icons.open_in_new,
                        color: Colors.black,
                        size: ScreenUtil().setHeight(45),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(12),
                    ),
                    Text(
                      data.url,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

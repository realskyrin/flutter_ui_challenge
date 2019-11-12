import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/rendering.dart';

class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //timeDilation = 5.0; // debug mode slow down the speed for animation dilation,1.0 means normal animation speed.

    return Scaffold(
        appBar: AppBar(
          title: Text("HeroPage"),
        ),
        body: Center(
          child: PhotoHero(
            photo: 'images/dzq.jpg',
            width: 300.0,
            onTap: () {
              Navigator.of(context).push(
                getDestinationRoute()
              );
            },
          ),
        ));
  }

  getDestinationRoute(){
    return MaterialPageRoute<void>(builder: (BuildContext ctx) {
      return Scaffold(
        appBar: AppBar(
          title: Text('FlippersPage'),
        ),
        body: Container(
          color: Colors.green,
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              PhotoHero(
                photo: 'images/dzq.jpg',
                width: 100,
                onTap: () {
                  Navigator.of(ctx).pop();
                }
              ),
              SizedBox(height: 16,),
              Text("邓紫棋（英语：Gloria Tang Tsz-kei，1991年8月16日－），"
                  "又名G.E.M.（“Get Everyone Moving / Get Everybody Moving / God Empowers Miracle”的简称，"
                  "即“让大家动起来 / 上帝赋予奇迹”），本名邓诗颖（英语：Gloria Tang Sze-wing），"
                  "是一名香港创作歌手。她生于中国上海，四岁时移居到英属香港。"
                  "2008年7月10日，以16岁之龄出道，取得香港各大乐坛颁奖礼新人金奖。",
                style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      );
    });
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero({Key key,this.photo,this.onTap,this.width});
  final String photo;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
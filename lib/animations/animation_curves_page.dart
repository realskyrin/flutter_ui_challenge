import 'package:flutter/material.dart';

class AnimatedCurvesPage extends StatefulWidget {
  @override
  _AnimatedCurvesPageState createState() => _AnimatedCurvesPageState();
}

class _AnimatedCurvesPageState extends State<AnimatedCurvesPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus status;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller,curve: Curves.elasticOut);
    /// 正向执行动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType
            .toString()
            .substring(1, runtimeType.toString().length - "State".length)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /// 没有调用 setState，所以不会被刷新
          Text("value: ${animation.value.toInt()}"),
          /// 没有调用 setState，所以不会被刷新
          Text("state: $status"),
          AnimatedLogo(
            animation: animation,
          )
        ],
      ),
      bottomNavigationBar: _getBottomBar(),
    );
  }

  @override
  void dispose() {
    /// 释放 controller 对象使用的资源，调用该方法后 controller 将不可用
    controller.dispose();
    super.dispose();
  }

  _getBottomBar() {
    return Container(
      color: Colors.black12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[
                Text("Forward"),
                Icon(Icons.forward),
              ],
            ),
            onPressed: () {
              controller.forward();
            },
          ),
          FlatButton(
            child: Row(
              children: <Widget>[
                Text("Reverse"),
                RotatedBox(
                  quarterTurns: 2,
                  child: Icon(Icons.forward),
                ),
              ],
            ),
            onPressed: () {
              /// 逆向执行动画
              controller.reverse();
            },
          ),
        ],
      ),
    );
  }
}

class AnimatedLogo extends AnimatedWidget {
  static final _sizeTween = Tween<double>(begin: 0,end: 300);

  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final am = listenable as Animation<double>;
    return Container(
      child: FlutterLogo(),
      width: 300,
      height: _sizeTween.evaluate(am),
    );
  }
}

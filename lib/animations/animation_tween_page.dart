import 'package:flutter/material.dart';

class AnimationTweenPage extends StatefulWidget {
  @override
  _AnimationTweenPageState createState() => _AnimationTweenPageState();
}

class _AnimationTweenPageState extends State<AnimationTweenPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        /// 当 Animation.value 变化时被调用
        setState(() {});
      });

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
        children: <Widget>[
          Text("value: ${animation.value.toInt()}"),
          Container(
            child: FlutterLogo(),
            width: animation.value,
            height: animation.value,
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
            onPressed: (){
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
            onPressed: (){
              /// 逆向执行动画
              controller.reverse();
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatefulWidget {
  @override
  _AnimatedBuilderPageState createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus status;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addStatusListener((status) => {
        if (status == AnimationStatus.completed)
          {controller.reverse()}
        else if (status == AnimationStatus.dismissed)
          {controller.forward()}
      });

    /// 正向执行动画
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
          GrowTransition(
            child: LogoWidget(),
            animation: animation,
          )
        ],
      ),
      bottomNavigationBar: _getBottomBar(),
    );
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

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child,this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context,widget) => Container(
        height: animation.value,
        width: animation.value,
        child: widget,
      ),
    ),
  );
}



import 'package:flutter/material.dart';

class OpacityPage extends StatefulWidget {
  @override
  _OpacityPageState createState() => _OpacityPageState();
}

class _OpacityPageState extends State<OpacityPage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 2),vsync: this);
    animation = CurvedAnimation(parent: controller,curve: Curves.easeInOut);
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
      body: Center(
        child: Center(
          child: OpacityLogo(animation: animation,),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisAlignment: MainAxisAlignment.end,
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

class OpacityLogo extends AnimatedWidget {
  OpacityLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Opacity(
      opacity: animation.value,
      child: Container(
        width: 300,
        height: 300,
        color: Colors.green,
      ),
    );
  }

}



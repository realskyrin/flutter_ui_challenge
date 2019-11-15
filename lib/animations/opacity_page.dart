import 'package:flutter/material.dart';

class OpacityPage extends StatefulWidget {
  @override
  _OpacityPageState createState() => _OpacityPageState();
}

class _OpacityPageState extends State<OpacityPage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  _OpacityPageState(){
    print(">>>>>>构造方法>>>>>>");
  }

  @override
  void initState() {
    print(">>>>>>initState>>>>>>");
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 2),vsync: this);
    animation = CurvedAnimation(parent: controller,curve: Curves.easeInOut);
    controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print(">>>>>>didChangeDependencies>>>>>>");
  }

  @override
  void dispose() {
    print(">>>>>>dispose>>>>>>");
    controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(OpacityPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print(">>>>>>didUpdateWidget>>>>>>");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print(">>>>>>deactivate>>>>>>");
  }

  @override
  Widget build(BuildContext context) {
    print(">>>>>>build>>>>>>");
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



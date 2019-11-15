import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  // 红色 container 坐标
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType
            .toString()
            .substring(1, runtimeType.toString().length - "State".length)),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: Container(color: Colors.red,width: 50,height: 50),
              onPanUpdate: (e){ // 拖动回调
                setState(() {
                  // 更新位置
                  _left+=e.delta.dx;
                  _top+=e.delta.dy;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

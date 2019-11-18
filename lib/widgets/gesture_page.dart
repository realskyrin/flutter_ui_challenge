import 'package:flutter/gestures.dart';
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
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: _top,
                  left: _left,
                  child: GestureDetector(
                    child: Container(
                      color: Colors.red,
                      width: 50,
                      height: 50,
                      child: Text(
                        "Drag",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onTap: () => print("onTap"),
                    onDoubleTap: () => print("onDoubleTap"),
                    onLongPress: () => print("onLongPress"),
                    onPanUpdate: (e) {
                      // 拖动回调
                      setState(() {
                        // 更新位置
                        _left += e.delta.dx;
                        _top += e.delta.dy;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
//            child: GestureDetector(
//              onTap: () => print('Parent tapped'), // 父视图的点击回调不会被响应
//              child: Container(
//                color: Colors.green,
//                child: Center(
//                  child: GestureDetector(
//                    onTap: () => print('Child tapped'), // 子视图的点击回调
//                    child: Container(
//                      color: Colors.amber,
//                      width: 100.0,
//                      height: 100.0,
//                    ),
//                  ),
//                ),
//              ),
//            ),
            child: RawGestureDetector(
              // 自己构造父 Widget 的手势识别映射关系
              gestures: {
                // 建立多手势识别器与手势识别工厂类的映射关系，从而返回可以响应该手势的 recognizer
                MultipleTapGestureRecognizer:
                    GestureRecognizerFactoryWithHandlers<
                            MultipleTapGestureRecognizer>(
                        () => MultipleTapGestureRecognizer(),
                        (MultipleTapGestureRecognizer instance) {
                  instance.onTap = () => print('parent tapped '); // 点击回调
                })
              },
              child: Container(
                color: Colors.green,
                child: Center(
                  child: GestureDetector(
                    onTap: () => print('Child tapped'),
                    // 子视图可以继续使用 GestureDetector
                    child: Container(
                      color: Colors.amber,
                      width: 100.0,
                      height: 100.0,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// 自定义一个手势识别器
class MultipleTapGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    // 当此手势识别器在竞技场被 PK 失败时，重新手动复活手势
    acceptGesture(pointer);
  }
}

import 'package:flutter/material.dart';

class Utils{
  /// 获取一个分割线
  static Widget getDivider(String label) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Divider(
              height: 3,
              color: Colors.blue,
              endIndent: 10,
            )),
        Text(label, style: TextStyle(fontSize: 10, color: Colors.blue)),
        Expanded(
            flex: 1,
            child: Divider(
              height: 3,
              color: Colors.blue,
              indent: 10,
            )),
      ],
    );
  }

  static Widget getDividerMarginLR(String label) {
    return Row(
      children: <Widget>[
        getWSizedBox(),
        Expanded(child: getDivider(label)),
        getWSizedBox()
      ],
    );
  }

  static Widget getDividerMarginTB(String label) {
    return Column(
      children: <Widget>[
        getHSizedBox(),
        getDivider(label),
        getHSizedBox()
      ],
    );
  }


  static Widget getDividerMarginLRTB(String label) {
    return Column(
      children: <Widget>[
        getHSizedBox(),
        getDividerMarginLR(label),
        getHSizedBox()
      ],
    );
  }

  static SizedBox getHSizedBox(){
    return SizedBox(
      height: 16
    );
  }

  static SizedBox getWSizedBox(){
    return SizedBox(
      width: 16
    );
  }
}
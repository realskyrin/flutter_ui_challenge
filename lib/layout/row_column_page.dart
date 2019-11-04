import 'package:flutter/material.dart';

class RowPage extends StatefulWidget {
  @override
  _RowPageState createState() => _RowPageState();
}

class _RowPageState extends State<RowPage> {
  bool _isRow = true;

  /// 主轴尺寸大小
  /// max(占满空间)
  /// min(包裹内容)
  MainAxisSize _mainAxisSize = MainAxisSize.max;

  /// 主轴对齐方式
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.center;

  /// 交叉轴(与主轴相交的轴)对齐方式
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;

  /// 文字基准线
  TextBaseline _textBaseline = TextBaseline.alphabetic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType
            .toString()
            .substring(1, runtimeType.toString().length - 5)),
      ),
      body: _getBody(),
      bottomNavigationBar: _getBottomBar(),
    );
  }

  Widget _getBottomBar() {
    return Container(
      color: Colors.black12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Radio(
                    groupValue: _isRow,
                    onChanged: (b) {
                      setState(() {
                        _isRow = b;
                      });
                    },
                    value: true,
                  ),
                  Text("Row")
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    groupValue: _isRow,
                    onChanged: (b) {
                      setState(() {
                        _isRow = b;
                      });
                    },
                    value: false,
                  ),
                  Text("Column")
                ],
              )
            ],
          ),
          ListTile(
            title: Text("mainAxisSize"),
            trailing: DropdownButton(
              items: MainAxisSize.values
                  .map((MainAxisSize val) => DropdownMenuItem(
                        value: val,
                        child: Text(
                            val.toString().substring("MainAxisSize.".length)),
                      ))
                  .toList(),
              onChanged: (MainAxisSize newVal) {
                if (newVal != null) {
                  setState(() {
                    this._mainAxisSize = newVal;
                  });
                }
              },
              value: _mainAxisSize,
            ),
          ),
          ListTile(
            title: Text("mainAxisAlignment"),
            trailing: DropdownButton(
              items: MainAxisAlignment.values
                  .map((MainAxisAlignment val) => DropdownMenuItem(
                        value: val,
                        child: Text(val
                            .toString()
                            .substring("MainAxisAlignment.".length)),
                      ))
                  .toList(),
              onChanged: (MainAxisAlignment newVal) {
                if (newVal != null) {
                  setState(() {
                    this._mainAxisAlignment = newVal;
                  });
                }
              },
              value: _mainAxisAlignment,
            ),
          ),
          ListTile(
            title: Text("crossAxisAlignment"),
            trailing: DropdownButton(
              items: CrossAxisAlignment.values
                  .map((CrossAxisAlignment val) => DropdownMenuItem(
                        value: val,
                        child: Text(val
                            .toString()
                            .substring("CrossAxisAlignment.".length)),
                      ))
                  .toList(),
              onChanged: (CrossAxisAlignment newVal) {
                if (newVal != null) {
                  setState(() {
                    this._crossAxisAlignment = newVal;
                  });
                }
              },
              value: _crossAxisAlignment,
            ),
          ),
          ListTile(
            title: Text("textBaseline"),
            trailing: DropdownButton(
              items: TextBaseline.values
                  .map((TextBaseline val) => DropdownMenuItem(
                        value: val,
                        child: Text(val
                            .toString()
                            .substring("TextBaseline.".length)),
                      ))
                  .toList(),
              onChanged: (TextBaseline newVal) {
                if (newVal != null) {
                  setState(() {
                    this._textBaseline = newVal;
                  });
                }
              },
              value: _textBaseline,
            ),
          ),
        ],
      ),
    );
  }

  static const stars = <Widget>[
    Icon(
      Icons.stars,
      size: 30,
    ),
    Icon(
      Icons.stars,
      size: 60,
    ),
    Icon(
      Icons.stars,
      size: 30,
    ),
//      Text("مي",style: TextStyle(fontSize: 80),),
//      Text("a",style: TextStyle(fontSize: 130),),
//      Text("مي",style: TextStyle(fontSize: 80),),
  ];

  Widget _getBody() => Container(
        color: Colors.amber,
        child: _isRow
            ? Row(
                mainAxisSize: _mainAxisSize,
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: _crossAxisAlignment,
                textBaseline: _textBaseline,
                children: stars,
              )
            : Column(
                mainAxisSize: _mainAxisSize,
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: _crossAxisAlignment,
                textBaseline: _textBaseline,
                children: stars,
              ),
      );
}

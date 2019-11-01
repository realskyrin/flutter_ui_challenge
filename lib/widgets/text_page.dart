import 'package:flutter/material.dart';

class TextPage extends StatefulWidget {
  @override
  _TextPageState createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  bool _deleteLine = false;
  bool _deleteLineWave = false;
  bool _bgColor = false;
  double _textSize = 25;
  bool _textDirection = false;
  bool _textSpan = false;

  List<InlineSpan> _getTextSpan(){
    if(_textSpan){
      return [
        TextSpan(
            text: '这是一段',
            style: TextStyle(color: Colors.blue)),
        TextSpan(
            text: '富文本，',
            style: TextStyle(color: Colors.red)),
        TextSpan(
            text: '为了能让它换行，所以多写了',
            style: TextStyle(color: Colors.blue)),
        TextSpan(
            text: '几个字。',
            style: TextStyle(color: Colors.red)),
        TextSpan(
            text: '为了能让它换行，所以多写了',
            style: TextStyle(color: Colors.blue)),
        TextSpan(
            text: '几个字。',
            style: TextStyle(color: Colors.red)),
        TextSpan(
            text: '（RichText）',
            style: TextStyle(color: Colors.amber)),
      ];
    }else{
      return [TextSpan(
        text: '这是一段富文本，为了能让它换行，所以多写了几个字。为了能让它换行，所以多写了几个字。（RichText）',
        style: TextStyle(color: Colors.blue),
      )];
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextPage'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.amber, width: 2.0, style: BorderStyle.solid)),
            child: Center(
              child: Text(
                '文本（Text）',
                style: TextStyle(
                    fontSize: _textSize,
                    color: Colors.blue,
                    decoration: _deleteLine
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    backgroundColor:
                        _bgColor ? Colors.amber[100] : Colors.transparent,
                    decorationStyle: _deleteLineWave
                        ? TextDecorationStyle.wavy
                        : TextDecorationStyle.solid),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView(
              primary: false,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '字体大小',
                        style: TextStyle(fontSize: 16),
                      ),
                      margin: EdgeInsets.only(left: 16),
                    ),
                    Expanded(
                      child: Slider(
                          value: _textSize.toDouble(),
                          min: 10,
                          max: 40,
                          onChanged: (newValue) {
                            setState(() {
                              _textSize = newValue;
                            });
                          }),
                    )
                  ],
                ),
                SwitchListTile(
                  value: _deleteLine,
                  title: Text('中划线'),
                  onChanged: (bool b) {
                    setState(() {
                      _deleteLine = b;
                    });
                  },
                ),
                CheckboxListTile(
                  value: _deleteLineWave,
                  title: Text('波浪线'),
                  subtitle: Text('需启用中划线'),
                  onChanged: (b) {
                    setState(() {
                      _deleteLineWave = b;
                    });
                  },
                ),
                CheckboxListTile(
                  value: _bgColor,
                  title: Text('背景色'),
                  onChanged: (b) {
                    setState(() {
                      _bgColor = b;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.amber, width: 2.0, style: BorderStyle.solid)),
            child: RichText(
              text: TextSpan(
                children: _getTextSpan(),
              ),
              textDirection:
                  _textDirection ? TextDirection.rtl : TextDirection.ltr,
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView(
              primary: false,
              children: <Widget>[
                CheckboxListTile(
                  value: _textDirection,
                  title: Text('文字方向'),
                  subtitle: Text('改变文字方向为从右向左（e.g 阿拉伯文）'),
                  onChanged: (b) {
                    setState(() {
                      _textDirection = b;
                    });
                  },
                ),CheckboxListTile(
                  value: _textSpan,
                  title: Text('文字片段'),
                  onChanged: (b) {
                    setState(() {
                      _textSpan = b;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

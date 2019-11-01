import 'package:flutter/material.dart';

class ButtonPage extends StatefulWidget {
  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  bool _enabledButton = true;
  double _volume = 0.0;
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ButtonPage'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 16),
                _getDivider("RaisedButton"),
                const RaisedButton(
                  onPressed: null,
                  child: Text('Disabled Button', style: TextStyle(fontSize: 20)),
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      _enabledButton = !_enabledButton;
                    });
                  },
                  child: Text('Enabled Button', style: TextStyle(fontSize: 20)),
                ),
                RaisedButton.icon(
                  label: Text('Button with icon',
                      style: TextStyle(
                          fontSize: 20,
                          color: _enabledButton ? Colors.white : Colors.black38)),
                  icon: Icon(Icons.add_shopping_cart,
                      color: _enabledButton ? Colors.white : Colors.black38),
                  color: Colors.green,
                  onPressed: _enabledButton
                      ? () {
//                  SnackBar(content: Text("add to "));
                  }
                      : null,
                ),
                RaisedButton(
                  onPressed: () {},
                  textColor: Colors.white,
                  padding: EdgeInsets.all(0),
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.purple, Colors.blue, Colors.red])),
                    padding: EdgeInsets.all(10),
                    child:
                    Text('Gradient Button', style: TextStyle(fontSize: 20)),
                  ),
                ),
                SizedBox(height: 16),
                _getDivider("IconButton"),
                IconButton(icon: Icon(Icons.android), onPressed: null),
                IconButton(
                    icon: Icon(Icons.android),
                    color: Colors.green,
                    onPressed: () {}),
                Container(
                  child: Ink(
                    decoration: ShapeDecoration(
                      color: Colors.lightBlue,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.android),
                      color: Colors.white,
                      onPressed: () {
                        print("filled background");
                      },
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.volume_up),
                      tooltip: 'Increase volume by 10',
                      onPressed: () {
                        setState(() {
                          _volume += 10;
                        });
                      },
                    ),
                    Text('Volume : $_volume')
                  ],
                ),

                SizedBox(height: 16),
                _getDivider("DropdownButton"),

                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(
                      color: Colors.deepPurple
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['One', 'Two', 'Free', 'Four']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  })
                      .toList(),
                ),


                SizedBox(height: 16),
                _getDivider("FlatButton"),


                FlatButton(onPressed: null, child: Text(
                  "Flat Button",
                )),
                FlatButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: () {
                    /*...*/
                  },
                  child: Text(
                    "Flat Button",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),


              ],
            ),
          ),
        )

    );
  }

  /// 获取一个分割线
  Row _getDivider(String label) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Divider(
              height: 3,
              color: Colors.blue,
              indent: 10,
              endIndent: 10,
            )),
        Text(label, style: TextStyle(fontSize: 10, color: Colors.blue)),
        Expanded(
            flex: 1,
            child: Divider(
              height: 3,
              color: Colors.blue,
              indent: 10,
              endIndent: 10,
            )),
      ],
    );
  }
}

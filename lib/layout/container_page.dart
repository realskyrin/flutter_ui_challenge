import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  double _padding = 16.0;
  double _margin = 16.0;
  Alignment alignment = Alignment.topLeft;
  Color bgColor = Colors.amber;

  static const alignmentValues = <String, Alignment>{
    'topLeft': Alignment.topLeft,
    'topCenter': Alignment.topCenter,
    'topRight': Alignment.topRight,
    'centerLeft': Alignment.centerLeft,
    'center': Alignment.center,
    'centerRight': Alignment.centerRight,
    'bottomLeft': Alignment.bottomLeft,
    'bottomCenter': Alignment.bottomCenter,
    'bottomRight': Alignment.bottomRight,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType
            .toString()
            .substring(1, runtimeType.toString().length - 5)),
      ),
      body: Container(
        padding: EdgeInsets.all(_padding),
        margin: EdgeInsets.all(_margin),
        color: bgColor,
        alignment: alignment,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.green,
        ),
      ),
      bottomNavigationBar: getBottomBar(),
    );
  }

  getBottomBar() {
    var bgColors = <Widget, Color>{
      SizedBox(
        width: 20,
        height: 20,
        child: Container(
          color: Colors.amber,
        ),
      ): Colors.amber,
      SizedBox(
        width: 20,
        height: 20,
        child: Container(
          color: Colors.red[200],
        ),
      ): Colors.red[200],
      SizedBox(
        width: 20,
        height: 20,
        child: Container(
          color: Colors.deepOrange[100],
        ),
      ): Colors.deepOrange[100],
    };

    return Container(
      color: Colors.black12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text("padding"),
            trailing: SizedBox(
              width: 200,
              child: Slider(
                  value: _padding,
                  min: 0,
                  max: 60,
                  onChanged: (newValue) {
                    setState(() {
                      _padding = newValue;
                    });
                  }),
            ),
          ),
          ListTile(
            title: Text("margin"),
            trailing: SizedBox(
              width: 200,
              child: Slider(
                  value: _margin,
                  min: 0,
                  max: 60,
                  onChanged: (newValue) {
                    setState(() {
                      _margin = newValue;
                    });
                  }),
            ),
          ),
          ListTile(
            title: Text("alignment"),
            trailing: DropdownButton(
                value: alignment,
                items: alignmentValues
                    .map((String name, Alignment val) => MapEntry(
                        name, DropdownMenuItem(value: val, child: Text(name))))
                    .values
                    .toList(),
                onChanged: (newVal) {
                  setState(() {
                    alignment = newVal;
                  });
                }),
          ),
          ListTile(
            title: Text("color"),
            trailing: DropdownButton(
                value: bgColor,
                items: bgColors
                    .map((Widget name, Color val) => MapEntry(
                        name, DropdownMenuItem(value: val, child: name)))
                    .values
                    .toList(),
                onChanged: (newVal) {
                  setState(() {
                    bgColor = newVal;
                  });
                }),
          ),
        ],
      ),
    );
  }
}

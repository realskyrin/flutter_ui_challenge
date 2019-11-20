import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  bool vertical = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType
            .toString()
            .substring(1, runtimeType.toString().length - "State".length)),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              child: InkWell(
                borderRadius:
                    new BorderRadius.circular(AppBar().preferredSize.height),
                child: Icon(
                  vertical ? Icons.view_agenda : Icons.view_column,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    vertical = !vertical;
                  });
                },
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return
            Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                title: Text("title $index"),
                subtitle: Text("subtitle $index"),
              ),
              index % 2 == 0
                  ? Divider(color: Colors.green)
                  : Divider(color: Colors.red),
            ],
          );
        },
        scrollDirection: vertical ? Axis.vertical : Axis.horizontal,
        itemCount: 100,
        itemExtent: 100,
      ),
    );
  }
}

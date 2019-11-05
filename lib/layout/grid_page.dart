import 'package:flutter/material.dart';

class GridPage extends StatefulWidget {
  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  bool multiple = true;

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
                  multiple ? Icons.dashboard : Icons.view_agenda,
                  color: Colors.white,
                ),
                onTap: () {
                  setState(() {
                    multiple = !multiple;
                  });
                },
              ),
            ),
          )
        ],
      ),
      body: GridView(
        padding:
        EdgeInsets.all(12),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Card(color: Colors.green,elevation: 3,child: InkWell(onTap: (){},splashColor: Colors.amber,borderRadius: BorderRadius.circular(4.0),),),
          Card(color: Colors.green,elevation: 3,child: InkWell(onTap: (){},splashColor: Colors.amber,borderRadius: BorderRadius.circular(4.0),),),
          Card(color: Colors.green,elevation: 3,child: InkWell(onTap: (){},splashColor: Colors.amber,borderRadius: BorderRadius.circular(4.0),),),
          Card(color: Colors.green,elevation: 3,child: InkWell(onTap: (){},splashColor: Colors.amber,borderRadius: BorderRadius.circular(4.0),),),
          Card(color: Colors.green,elevation: 3,child: InkWell(onTap: (){},splashColor: Colors.amber,borderRadius: BorderRadius.circular(4.0),),),
          Card(color: Colors.green,elevation: 3,child: InkWell(onTap: (){},splashColor: Colors.amber,borderRadius: BorderRadius.circular(4.0),),),
          Card(color: Colors.green,elevation: 3,child: InkWell(onTap: (){},splashColor: Colors.amber,borderRadius: BorderRadius.circular(4.0),),),
        ],
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: multiple ? 2 : 1,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
          /// 子元素 cross-axis 长度 / main-axis 长度
          childAspectRatio: 1.5,
        ),
      ),
    );
  }
}

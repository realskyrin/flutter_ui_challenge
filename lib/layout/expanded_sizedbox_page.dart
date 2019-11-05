import 'package:flutter/material.dart';

class ExpandedPage extends StatefulWidget {
  @override
  _ExpandedPageState createState() => _ExpandedPageState();
}

class _ExpandedPageState extends State<ExpandedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType
            .toString()
            .substring(1, runtimeType.toString().length - "State".length)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[

            Row(
              children: <Widget>[
                SizedBox(width: 100,height: 100,child: Container(color: Colors.amber,),),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    margin: EdgeInsets.only(left: 8),
                    color: Colors.blue,
                  ),
                )
              ],
            ),

            Expanded(
              flex: 1,
              child: Container(
                alignment: AlignmentDirectional.center,
                margin: EdgeInsets.only(top: 8,bottom: 8),
                color: Colors.green,
                child: Icon(Icons.four_k,color: Colors.white,),
              ),
            ),

            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    margin: EdgeInsets.only(right: 8),
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 100,height: 100,child: Container(color: Colors.amber,),),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

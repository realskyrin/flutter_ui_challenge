import 'package:flutter/material.dart';
import 'package:ui_challenge/router.dart';

class LayoutPage extends StatefulWidget {
  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  List<String> titles = [
    "Container",
    "Grid",
    "Expanded & Sizedbox",
    "Row & Column",
    "Stack",
    "Wrap",
    "Route & Aguments"
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context,index){
          return GestureDetector(
            child: ListTile(title: Text(titles[index]),),
            onTap: (){
              Router.pushNoParams(context, titles[index]);
            },
          );
        },
        separatorBuilder: (context,index){
          return Divider();
        },
        itemCount: titles.length
    );
  }
}

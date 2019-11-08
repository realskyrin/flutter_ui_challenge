import 'package:flutter/material.dart';
import 'package:ui_challenge/router.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  List<String> titles = ["Animation & Tween","Opacity", "Hero", "Staggered", "AnimatedContainer"];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, index) {
          return GestureDetector(
            child: ListTile(title: Text(titles[index]),),
            onTap: (){
              Router.pushNoParams(context, titles[index]);
            },
          );
        },
        separatorBuilder: (ctx, index) {
          return Divider();
        },
        itemCount: titles.length
    );
  }
}

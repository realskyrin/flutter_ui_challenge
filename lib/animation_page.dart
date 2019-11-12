import 'package:flutter/material.dart';
import 'package:ui_challenge/router.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  List<String> titles = [
    Router.animationTween,
    Router.animatedWidget,
    Router.animatedBuilder,
    Router.curvedAnimation,
    Router.opacity,
    Router.hero,
    Router.radialExpansion,
    Router.staggered,
    Router.animatedContainer
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, index) {
          return GestureDetector(
            child: ListTile(
              title: Text(titles[index]),
            ),
            onTap: () {
              Router.pushNoParams(context, titles[index]);
            },
          );
        },
        separatorBuilder: (ctx, index) {
          return Divider();
        },
        itemCount: titles.length);
  }
}

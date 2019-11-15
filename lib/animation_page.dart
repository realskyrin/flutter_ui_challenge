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
  
  _AnimationPageState(){
    print("---------构造方法---------");
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("---------initState---------");
  }
  
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("---------didChangeDependencies---------");
  }

  @override
  Widget build(BuildContext context) {
    print("---------build---------");
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
  
  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print("---------setState---------");
  }
  
  @override
  void didUpdateWidget(AnimationPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("---------didUpdateWidget---------");
  }
  
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("---------deactivate---------");
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("---------dispose---------");
  }
}

import 'package:flutter/material.dart';
import 'package:ui_challenge/animations/photo_hero.dart';

class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    timeDilation = 5.0;

    return Scaffold(
        appBar: AppBar(
          title: Text("HeroPage"),
        ),
        body: Center(
          child: PhotoHero(
            photo: 'images/dzq.jpg',
            width: 300.0,
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (BuildContext ctx){
                  return Scaffold(
                    appBar: AppBar(
                      title: Text('FlippersPage'),
                    ),
                    body: Container(
                      color: Colors.green,
                      padding: EdgeInsets.all(16.0),
                      alignment: Alignment.topLeft,
                      child: PhotoHero(
                        photo: 'images/dzq.jpg',
                        width: 100,
                        onTap: (){
                          Navigator.of(ctx).pop();
                        },
                      ),
                    ),
                  );
                }
              ));
            },
          ),
        )
    );
  }
}


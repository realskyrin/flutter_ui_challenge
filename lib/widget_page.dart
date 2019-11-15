import 'package:flutter/material.dart';
import 'package:ui_challenge/router.dart';
import 'package:ui_challenge/widgets/text_page.dart';

class WidgetPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => TextPage()));
          },
          child: Container(
            height: 50,
            color: Colors.green[300],
            child: const Center(child: Text('Text',style: TextStyle(color: Colors.white),)),
          ),
        ),
        GestureDetector(
          onTap: (){
            Router.pushNoParams(context, Router.imageIconPage);
          },
          child: Container(
            height: 50,
            color: Colors.green[400],
            child: const Center(child: Text('Image & Icon',style: TextStyle(color: Colors.white))),
          ),
        ),
        GestureDetector(
          onTap: (){
            Router.pushNoParams(context, Router.buttonPage);
          },
          child: Container(
            height: 50,
            color: Colors.green[500],
            child: const Center(child: Text('Button',style: TextStyle(color: Colors.white))),
          ),
        ),
        GestureDetector(
          onTap: (){
            Router.pushNoParams(context, Router.inputPage);
          },
          child: Container(
            height: 50,
            color: Colors.green[600],
            child: const Center(child: Text('Input',style: TextStyle(color: Colors.white))),
          ),
        ),
        GestureDetector(
          onTap: (){
            Router.pushNoParams(context, Router.dialogPage);
          },
          child: Container(
            height: 50,
            color: Colors.green[500],
            child: const Center(child: Text('Dialog',style: TextStyle(color: Colors.white))),
          ),
        ),
        GestureDetector(
          onTap: (){
            Router.pushNoParams(context, Router.snackBar);
          },
          child: Container(
            height: 50,
            color: Colors.green[400],
            child: const Center(child: Text('SnackBar',style: TextStyle(color: Colors.white))),
          ),
        ),
        GestureDetector(
          onTap: (){
            Router.pushNoParams(context, Router.cardPage);
          },
          child: Container(
            height: 50,
            color: Colors.green[300],
            child: const Center(child: Text('Card & Inkwell',style: TextStyle(color: Colors.white))),
          ),
        ),
        GestureDetector(
          onTap: (){
            Router.pushNoParams(context, Router.gesturePage);
          },
          child: Container(
            height: 50,
            color: Colors.green[300],
            child: const Center(child: Text('Gesture',style: TextStyle(color: Colors.white))),
          ),
        ),
      ],
    );
  }
}
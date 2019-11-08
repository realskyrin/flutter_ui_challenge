import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ui_challenge/utils.dart';

class SnackBarPage extends StatefulWidget {
  @override
  _SnackBarPageState createState() => _SnackBarPageState();
}

class _SnackBarPageState extends State<SnackBarPage>
    with SingleTickerProviderStateMixin {
  bool _disablebtn = false;

//  Animation<double> _animation;
//  AnimationController _controller;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _controller = AnimationController(
//        duration: const Duration(milliseconds: 12000), vsync: this);
//    _animation = Tween(begin: 0.0, end: 300.0).animate(_controller);
//    _controller.forward();
//  }
//
//  @override
//  void dispose() {
//    // TODO: implement dispose
//    _controller.dispose();
//    super.dispose();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SnackBarPage"),
      ),
      body: Builder(
          builder: (context) => SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Utils.getDividerMarginLR("Defult SnackBar"),
                      SizedBox(
                        height: 16,
                      ),
                      RaisedButton(
                        onPressed:() {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("This is a snack bar, dismiss after 5 sec"),
                                  duration: Duration(seconds: 5),
                                ));
                              },
                        child: Text("Show Snackbar"),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      RaisedButton(
                        onPressed: !_disablebtn
                            ? () {
                                setState(() {
                                  _disablebtn = true;
                                });
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("Button was disabled"),
                                  duration: Duration(seconds: 5),
                                  action: SnackBarAction(
                                      label: "Undo",
                                      onPressed: () {
                                        setState(() {
                                          _disablebtn = false;
                                        });
                                      }),
                                ));
                              }
                            : null,
                        child: Text("Show Snackbar With Action"),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Utils.getDividerMarginLR("SnackBar With Shape"),
                      SizedBox(
                        height: 16,
                      ),
                      RaisedButton(
                          child: Text("Show Snackbar With Shape"),
                          onPressed: () {

                            Scaffold.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              content: Text("Show Snackbar With Shape"),
                              duration: Duration(seconds: 5),
                              shape: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.all(Radius.circular(25)),
                              ),
                            ));
                          })

                    ],
                  ),
                ),
              )),
    );
  }
}

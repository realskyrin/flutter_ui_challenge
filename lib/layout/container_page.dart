import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType.toString().substring(1,runtimeType.toString().length-5)),
      ),
      body: Container(

      ),
    );
  }
}

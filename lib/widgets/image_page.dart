import 'package:flutter/material.dart';
import 'package:ui_challenge/utils.dart';

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImagePage'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 16,),
            Utils.getDividerMarginLR("Icon"),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(Icons.favorite,color: Colors.pink,size: 24),
                Icon(Icons.android,color: Colors.green,size: 24),
                Icon(Icons.network_wifi,color: Colors.blue,size: 24),
              ],
            ),
            SizedBox(height: 16,),
            Utils.getDividerMarginLR("Image"),
            SizedBox(height: 16,),
            Image.network(
              "https://skyrin.oss-cn-qingdao.aliyuncs.com/images/app_demo/flutter.png",
            ),
            SizedBox(height: 16,),
            Image.asset("images/flutter.jpg"),
            SizedBox(height: 16,),

          ],
        ),
      ),
    );
  }
}

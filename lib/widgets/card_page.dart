import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:ui_challenge/utils/utils.dart';

class CardPage extends StatefulWidget {
  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CardPage"),
      ),
      body: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Utils.getDividerMarginLRTB("Card"),
            Card(
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                elevation: 3,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              "images/mv.webp",
                              height: 100,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "少年的你",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 6,
                                      ),
                                      _getLabel("2D", "IMAX")
                                    ],
                                  ),
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: "淘票票评分 ",
                                        style: TextStyle(color: Colors.black)),
                                    TextSpan(
                                        text: "9.4",
                                        style: TextStyle(
                                            color: Colors.amber,
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: " | ",
                                        style:
                                            TextStyle(color: Colors.grey[200])),
                                    TextSpan(
                                        text: "59.9万人评",
                                        style: TextStyle(color: Colors.black)),
                                  ])),
                                  Text("导演：曾国祥"),
                                  Text("主演：周冬雨 易洋千玺 尹昉"),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 24,
                                  child: GestureDetector(
                                    child: Container(
                                      padding:
                                          EdgeInsets.only(left: 8, right: 8),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Colors.pink[200],
                                            Colors.pink
                                          ], begin: Alignment.topLeft),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Text(
                                        "购票",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white),
                                      ),
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("特惠",
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.grey)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 88,
                        ),
                        _getTextWithBorder("票房榜No.1", Colors.blue, 8, 2),
                        SizedBox(
                          width: 4,
                        ),
                        _getTextWithBorder("口碑榜No.1", Colors.pink, 8, 2),
                        SizedBox(
                          width: 4,
                        ),
                        _getTextWithBorder("易洋千玺电影首秀", Colors.black, 8, 2),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    )
                  ],
                )),
            Card(
              margin: EdgeInsets.all(8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              elevation: 3,
              color: Colors.pink[400],
              child: Row(
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "¥",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "6",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ])),
                        Text("满40.0元可用",
                            style: TextStyle(fontSize: 10, color: Colors.white))
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 8,
                    color: Colors.pink[400],
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            _getDot(),
                            _getDot(),
                            _getDot(),
                            _getDot(),
                            _getDot(),
                            _getDot(),
                            _getDot(),
                            _getDot(),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                          width: 3.5,
                          child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 100,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
                            color: Colors.white),
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "淘票票电影代金券",
                                  style: TextStyle(fontSize: 15),
                                ),
                                Row(
                                  children: <Widget>[
                                    _getTextWithBorder(
                                        "限购电影票", Colors.black, 10, 2),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    _getTextWithBorder(
                                        "不可叠加", Colors.black, 10, 2),
                                  ],
                                ),
                                Text(
                                  "有效期至：2099-9-9",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  "淘票票直连影城使用",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Expanded(flex: 1, child: SizedBox()),
                            Container(
                              height: 24,
                              width: 60,
                              margin: EdgeInsets.only(right: 8),
                              alignment: Alignment.center,
                              child: OutlineButton(
                                onPressed: () {
                                  ///
                                },
                                child: Text(
                                  "使用",
                                  style: TextStyle(
                                      color: Colors.pink, fontSize: 14),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.pink,
                                ),
                                highlightedBorderColor: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getLabel(String l1, String l2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Text(
            " $l1 ",
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2), bottomLeft: Radius.circular(2)),
              color: Colors.grey),
        ),
        Container(
          alignment: Alignment.center,
          child: Text(
            " $l2 ",
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(2),
                  topRight: Radius.circular(2)),
              color: Colors.white),
        ),
      ],
    );
  }

  Widget _getTextWithBorder(
      String text, Color color, double fontSize, double radius) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: color, width: 0.5),
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      child: Text(
        " $text ",
        style: TextStyle(color: color, fontSize: fontSize),
      ),
    );
  }

  Widget _getDot() {
    return SizedBox(
      height: 6,
      width: 6,
      child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3), color: Colors.white)),
    );
  }
}

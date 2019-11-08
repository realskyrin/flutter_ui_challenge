import 'package:flutter/material.dart';
import 'package:ui_challenge/utils.dart';

class StackPage extends StatefulWidget {
  @override
  _StackPageState createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  AlignmentDirectional _alignment = AlignmentDirectional.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType
            .toString()
            .substring(1, runtimeType.toString().length - "State".length)),
      ),
      body: _getBody(),
      bottomNavigationBar: _getBottomBar(),
    );
  }

  _getBody() => Column(
        children: <Widget>[
          Utils.getDividerMarginLRTB("Custom widget by Stack"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[_getExpiredTag(), _getStampSeparation()],
          ),
          Utils.getDividerMarginLRTB("Showcase"),
          Stack(
            alignment: _alignment,
//            fit: StackFit.loose,
//            overflow: Overflow.clip,
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                color: Colors.green,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.amber,
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ],
          )
        ],
      );

  _getBottomBar() {
    const alignmentDirectionalVals = <String, AlignmentDirectional>{
      'topStart': AlignmentDirectional.topStart,
      'topCenter': AlignmentDirectional.topCenter,
      'topEnd': AlignmentDirectional.topEnd,
      'centerStart': AlignmentDirectional.centerStart,
      'center': AlignmentDirectional.center,
      'centerEnd': AlignmentDirectional.centerEnd,
      'bottomStart': AlignmentDirectional.bottomStart,
      'bottomCenter': AlignmentDirectional.bottomCenter,
      'bottomEnd': AlignmentDirectional.bottomEnd,
    };
    return Container(
      color: Colors.black12,
      child: ListTile(
        title: Text("alignment"),
        trailing: DropdownButton(
          value: _alignment,
          items: alignmentDirectionalVals
              .map((String name, AlignmentDirectional val) => MapEntry(
                  name, DropdownMenuItem(value: val, child: Text(name))))
              .values
              .toList(),
          onChanged: (newVal) {
            if(newVal!=null){
              setState(() {
                this._alignment = newVal;
              });
            }
          },
        ),
      ),
    );
  }

  Widget _getStampSeparation() => Container(
        height: 80,
        width: 50,
        color: Colors.pink,
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
              ],
            ),
            SizedBox(
              height: 100,
              width: 3.5,
              child:
                  DecoratedBox(decoration: BoxDecoration(color: Colors.white)),
            ),
            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getDot(),
                  _getDot(),
                  _getDot(),
                  _getDot(),
                  _getDot(),
                  _getDot(),
                  _getDot(),
                ],
              ),
              left: 0,
              bottom: 0,
              top: 0,
            ),
            Positioned(
              child: SizedBox(
                height: 100,
                width: 3.5,
                child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.white)),
              ),
              left: 0,
            ),
            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _getDot(),
                  _getDot(),
                  _getDot(),
                  _getDot(),
                  _getDot(),
                  _getDot(),
                  _getDot(),
                ],
              ),
              left: 22.5,
              bottom: 0,
              top: 0,
            )
          ],
        ),
      );

  Widget _getDot() {
    return SizedBox(
      height: 6,
      width: 6,
      child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3), color: Colors.white)),
    );
  }

  Widget _getExpiredTag() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SizedBox(
          width: 60,
          height: 60,
          child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 1),
                shape: BoxShape.circle),
          ),
        ),
        SizedBox(
          width: 35,
          height: 35,
          child: DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 1),
                shape: BoxShape.circle),
          ),
        ),
        GestureDetector(
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(25 / 360),
            child: Text(
              "PASS",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.green,
                  backgroundColor: Colors.white),
            ),
          ),
          onTap: () {},
        )
      ],
    );
  }
}

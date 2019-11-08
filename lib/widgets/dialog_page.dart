import 'package:flutter/material.dart';
import 'package:ui_challenge/utils.dart';

class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  bool _sheetShowing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DialogPage"),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          padding: EdgeInsets.only(left: 16, right: 16),
//        child: Center(
          child: ListBody(
            children: <Widget>[
              Utils.getDividerMarginTB("Regular Dialog"),
              RaisedButton(
                  child: Text("Show Dialog"),
                  onPressed: () {
                    _neverSatisfied();
                  }),

              /// Time picker
              RaisedButton(
                  child: Text("Time Picker Dialog"),
                  onPressed: () {
                    showTimePicker(
                            context: context, initialTime: TimeOfDay.now())
                        .then((TimeOfDay value) {
                      if (value != null) {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text("${value.format(context)}"),
                            action:
                                SnackBarAction(label: "OK", onPressed: () {}),
                          ),
                        );
                      }
                    });
                  }),

              /// Date Picker
              RaisedButton(
                  child: Text("Date Picker Dialog"),
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2018),
                            lastDate: DateTime(2030))
                        .then((value) {
                      if (value != null) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Time:$value")));
                      }
                    });
                  }),

              Utils.getDividerMarginTB("Combination Dialog"),
              RaisedButton(
                  child: Text("Show Login Dialog"),
                  onPressed: () {
                    _loginDialog();
                  }),
              Utils.getDividerMarginTB("Bottom Sheet"),

              /// Bottom Sheet
              RaisedButton(
                child: Text("Bottom Sheet"),
                onPressed: (){
                  if(_sheetShowing){
                    Navigator.pop(context);
                  }
                  showBottomSheet(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))
                    ),
                    context: context,
                      builder: (context)=>Container(
                        child: GridView.count(
                          primary: false,
                          shrinkWrap: true,
                          crossAxisCount: 4,
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            IconButton(
                                icon: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.favorite,color: Colors.white,),
                                    Text("点赞",style: TextStyle(fontSize: 10,color: Colors.white),)
                                  ],
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.bookmark,color: Colors.white,),
                                    Text("收藏",style: TextStyle(fontSize: 10,color: Colors.white),)
                                  ],
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.share,color: Colors.white,),
                                    Text("分享",style: TextStyle(fontSize: 10,color: Colors.white),)
                                  ],
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.attachment,color: Colors.white,),
                                    Text("复制链接",style: TextStyle(fontSize: 10,color: Colors.white),)
                                  ],
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.android,color: Colors.white,), onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.android,color: Colors.white), onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.close,color: Colors.white), onPressed: () {
                                  Navigator.pop(context);
                                  _sheetShowing = false;
                            }),
                            SizedBox(),
                          ],
                        ),
                      ),
                  );
                  _sheetShowing = true;
                },
              ),

              /// Modal Bottom Sheet
              RaisedButton(
                  child: Text("Modal Bottom Sheet"),
                  onPressed: () {
                    showModalBottomSheet<String>(
                      context: context,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10))
                      ),
                      builder: (context) => Container(
                        child: GridView.count(
                          primary: false,
                          shrinkWrap: true,
                          crossAxisCount: 4,
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            IconButton(
                                icon: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.favorite,color: Colors.red[300],),
                                    Text("点赞",style: TextStyle(fontSize: 10,color: Colors.red[300]),)
                                  ],
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.bookmark,color: Colors.amber[600],),
                                    Text("收藏",style: TextStyle(fontSize: 10,color: Colors.amber[600]),)
                                  ],
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.share,color: Colors.green,),
                                    Text("分享",style: TextStyle(fontSize: 10,color: Colors.green),)
                                  ],
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.attachment,color: Colors.purple,),
                                    Text("复制链接",style: TextStyle(fontSize: 10,color: Colors.purple),)
                                  ],
                                ),
                                onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.android), onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.android), onPressed: () {}),
                            IconButton(
                                icon: Icon(Icons.android), onPressed: () {}),
                            SizedBox(),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
//        ),
        ),
      ),
    );
  }

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _loginDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Lgoin'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(
                  height: 50,
                  child: TextField(
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Username'),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                PasswordField(
                  height: 50,
                  themColor: Colors.red,
                  labelText: "Password",
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Forget Password?'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: Icon(
                Icons.forward,
                color: Colors.green,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.height,
    this.themColor,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final double height;
  final Color themColor;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height,
        child: Theme(
            data: ThemeData(
                primaryColor: widget.themColor,
                primaryColorDark: widget.themColor),
            child: TextFormField(
              cursorColor: widget.themColor,
              obscureText: _obscureText,
              maxLines: 1,
              onSaved: widget.onSaved,
              validator: widget.validator,
              onFieldSubmitted: widget.onFieldSubmitted,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: widget.labelText,
                  hintText: widget.hintText,
                  helperText: widget.helperText,
                  prefixIcon: Icon(Icons.security),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                  )),
            )));
  }
}

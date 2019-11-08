import 'package:flutter/material.dart';
import 'package:ui_challenge/utils.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _userGender = '男';
  String _userName;
  String _userPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InputPage"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            Utils.getDivider("TextField"),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: TextField(
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Username'),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
                height: 50,
                child: Theme(
                    data: ThemeData(
                        primaryColor: Colors.red,
                        primaryColorDark: Colors.amber),
                    child: TextField(
                      cursorColor: Colors.red,
                      cursorWidth: 4,
                      cursorRadius: Radius.circular(2),
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.security),
                      ),
                    ))),
            SizedBox(
              height: 16,
            ),
            SizedBox(
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Email',
                  ),
                )),
            SizedBox(
              height: 16,
            ),
            SizedBox(
                height: 50,
                child: TextField(
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search),
                      labelText: 'Search',
                    ))),
            SizedBox(
              height: 16,
            ),
            Utils.getDivider("Form"),
            SizedBox(
              height: 16,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  DropdownButtonFormField<String>(
                    value: _userGender,
                    items: ['男', '女']
                        .map((label) => DropdownMenuItem(
                              child: Text(label),
                              value: label,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _userGender = value;
                      });
                    },
                    onSaved: (value) {
                      _userGender = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: '用户名'),
                    validator: (value) {
                      return value.length <= 5?"用户名必须大于 5 个字符":null;
                    },
                    onSaved: (value) {
                      _userName = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: '密码'),
                    obscureText: true,
                    validator: (value) {
                      print("validator pwd");
                      return value.length <= 8?"密码必须大于 8 个字符":null;
                    },
                    onSaved: (value) {
                      _userPassword = value;
                    },
                  ),
                  RaisedButton(
                    child: Text('注册'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        print(_userGender);
                        print(_userName);
                        print(_userPassword);
                      }else{
                        print("not validate");
                      }
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ui_challenge/animation_page.dart';
import 'package:ui_challenge/layout_page.dart';
import 'package:ui_challenge/widget_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UIChallenge',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: 'Flutter UI Challenge'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int _selectedIndex = 0;
  final _widgetItems = [WidgetPage(),LayoutPage(),AnimationPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _widgetItems[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.widgets),title: Text('Widgets')),
          BottomNavigationBarItem(icon: Icon(Icons.view_array),title: Text('Layouts')),
          BottomNavigationBarItem(icon: Icon(Icons.category),title: Text('Animations')),
        ],
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        fixedColor: Colors.green,
        type: BottomNavigationBarType.shifting,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 注册监听
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // 移除监听
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    print("######## $state");
    if(state == AppLifecycleState.resumed){
    }
  }
}

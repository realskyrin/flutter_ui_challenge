import 'package:flutter/material.dart';

class WrapPage extends StatefulWidget {
  @override
  _WrapPageState createState() => _WrapPageState();
}

class _WrapPageState extends State<WrapPage> {
  List<String> cls = [
    'Dart',
    'Java',
    'Kotlin',
    'CSharp',
    'PHP',
    'Scala',
    'Python',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(runtimeType
            .toString()
            .substring(1, runtimeType.toString().length - "State".length)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 8,
          runSpacing: 0,
          children: cls
              .map((String name) => Chip(
                    avatar: CircleAvatar(
                      child: Text(name.substring(0, 1).toUpperCase()),
                    ),
                    label: Text(name),
                    deleteIcon: Icon(Icons.close),
                    deleteIconColor: Colors.deepOrangeAccent,
                    elevation: 3,
                    onDeleted: () {
                      setState(() {
                        cls.remove(name);
                      });
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}

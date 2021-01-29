import 'package:flutter/material.dart';

import 'TapboxC.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "",
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('首页'),
          ),
          body: new ParentWidget2(),
        )
        //home: new ListContentDetail(),
        );
  }
}

class StatefulZh extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return secondStateTest();
  }
}

class secondStateTest extends State {
  @override
  Widget build(BuildContext context) {
    // 聚集 widgets
    /*
            默认情况下，行或列沿着其主轴会尽可能占用尽可能多的空间，
            但如果要将孩子紧密聚集在一起，可以将mainAxisSize设置为MainAxisSize.min。
             以下示例使用此属性将星形图标聚集在一起（如果不聚集，五张星形图标会分散开）
            */
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Icon(Icons.star, color: Colors.green),
        new Icon(Icons.star, color: Colors.green),
        new Icon(Icons.star, color: Colors.green),
        new Icon(Icons.star, color: Colors.green),
        new Icon(Icons.star, color: Colors.green),
      ],
    );
  }
}

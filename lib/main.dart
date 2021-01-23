//import 'dart:ffi';
// import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:flutter/semantics.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "",
      home: new StateListZh(),
    );
  }
}

class StateListZh extends StatefulWidget {
  @override
  createState() => ListContentDetail();
}

class ListContentDetail extends State {
  var screenWidth;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    //第二行下部的行文字部件
    Widget textSection = new Container(
      color: Color.fromARGB(255, 234, 123, 234),
      padding: const EdgeInsets.all(10),
      child: new Text(
        '''Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
    //第二行创建按钮组
    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButtonColumn(Icons.call, 'Call'),
          buildButtonColumn(Icons.near_me, 'Route'),
          buildButtonColumn(Icons.share, 'Share'),
        ],
      ),
    );
    //第三行
    Widget thirdRowSection = new Container(
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [BuildThirdRowLeftColumnContent()],
      ),
    );

    //MaterialApp
    return new MaterialApp(
      title: 'hjdfhjdhfjd',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("首页"),
        ),
        body: new ListView(
          children: [
            new Image.asset(
              'images/weixin.png',
              width: 600.0,
              height: 140.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
            thirdRowSection,
          ],
        ),
      ),
    );
  }

  //第一行标题行
  Widget titleSection = new Container(
    padding: const EdgeInsets.all(32.0),
    child: new Row(
      children: [
        new Expanded(
          child: new Column(
            //子部件横轴左对齐
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Container(
                //只有下部距离控件底部不为0
                //padding: const EdgeInsets.only(bottom: 8.0),
                child: new Text(
                  'Oeschinen Lake Campground',
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new Text(
                'Kandersteg, Switzerland',
                style: new TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        new Icon(
          Icons.star,
          color: Colors.red[500],
        ),
        new Text('41'),
      ],
    ),
  );

  //第二行中创建单个按钮组件
  Column buildButtonColumn(IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Icon(icon, color: color),
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            label,
            style: new TextStyle(
                fontWeight: FontWeight.w400, fontSize: 12.0, color: color),
          ),
        ),
      ],
    );
  }

  //第三行左边列内容
  Widget BuildThirdRowLeftColumnContent() {
    print('screenWidth = $screenWidth');
    var firstText = new Text('Strawberry Pavlova',
        style: new TextStyle(fontSize: 24, color: Colors.black));
    var black45 = Colors.black45;
    var secondText = new Text(
        '''hdsjdhjs jfdkjfd a  djkfd  fjdkjfkdj jfkdjfd , jf kdjfkdddd  fdjkfd jfkd fd f
          f djkfjd idefjdm main fdjfdjfd aaa end ''',
        softWrap: true, style: new TextStyle(fontSize: 12, color: black45));
    var secondTextContainer = new Container(
      width: screenWidth / 2.0,
      height: 140,
      color: Colors.yellow,
      padding: const EdgeInsets.all(10),
      child: secondText,
    );
    var column = new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [firstText, secondTextContainer],
    );
    return new Container(
      child: column,
    );
  }
}

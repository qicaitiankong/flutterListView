import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

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
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListContentDetail();
  }
}

class ListContentDetail extends State {
  @override
  Widget build(BuildContext context) {
    //创建按钮组
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
    //文字部件
    Widget textSection = new Container(
      color: Color.fromARGB(255, 234, 123, 234),
      padding: const EdgeInsets.all(10),
      child: new Text(
        '''Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
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
            textSection
          ],
        ),
      ),
    );
  }

  //创建标题行
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

  //创建单个按钮组件
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
}

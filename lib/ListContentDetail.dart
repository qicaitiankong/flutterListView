//使用material 创建列表测试页面
import 'package:flutter/material.dart';

//使用有状态部件创建列表
class ListContentDetail extends StatefulWidget {
  @override
  createState() => ListContentDetailState();
}

class ListContentDetailState extends State<ListContentDetail> {
  var screenWidth;
  static bool isCollected = false;
  //收藏按钮点击
  void _clickCollectButton() {
    setState(() {
      isCollected = !isCollected;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    //第二行下部的行文字部件
    Widget textSection = new Container(
      // color: Color.fromARGB(255, 234, 123, 234),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [BuildThirdRow()],
      ),
    );

    //MaterialApp
    return new ListView(
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

  //第三行
  Widget BuildThirdRow() {
    var firstText = new Text('Strawberry Pavlova',
        style: new TextStyle(fontSize: 24, color: Colors.black));
    var firstTextContainer = new Container(
      padding: const EdgeInsets.all(10),
      child: firstText,
    );
    var black45 = Colors.black45;
    var secondText = new Text(
        '''hdsjdhjs jfdkjfd a  djkfd  fjdkjfkdj jfkdjfd , jf kdjfkdddd  fdjkfd jfkd fd f
          f djkfjd idefjdm main fdjfdjfd aaa end ''',
        softWrap: true, style: new TextStyle(fontSize: 12, color: black45));
    var secondTextContainer = new Container(
      padding: const EdgeInsets.all(10),
      child: secondText,
    );
    var leftColumnContainer = new Container(
      width: screenWidth * 0.55,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          firstTextContainer,
          secondTextContainer,
          buildFirstRowOfFiveStar(),
          buildRowOfFiveStarsBottom()
        ],
      ),
    );

    var rightImage = new Container(
      padding: const EdgeInsets.all(10),
      width: screenWidth * 0.35,
      child: new Image.asset('images/reba.png', fit: BoxFit.cover),
    );
    var row = new Row(
      children: [leftColumnContainer, rightImage],
    );
    return new Container(
      height: 400,
      margin: new EdgeInsets.fromLTRB(0.0, 40, 0.0, 40),
      //添加带有阴影的卡片效果
      child: new Card(
        child: row,
      ),
    );
  }

  //5个五角星所在行
  Widget buildFirstRowOfFiveStar() {
    var textSection = new Text('170 ',
        style: new TextStyle(fontSize: 12.0, color: Colors.black));
    return new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [buildFiveStar(), textSection],
        ));
  }

  //5个五角星
  Widget buildFiveStar() {
    var starArr = <Widget>[];
    for (var index = 0; index < 5; index++) {
      var icon = new Icon(Icons.star, color: Colors.black);
      starArr.add(icon);
    }
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: starArr,
    );
  }

  //5个五角星下面的一行
  Widget buildRowOfFiveStarsBottom() {
    var descTextStyle = new TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontFamily: 'Roboto',
        letterSpacing: 0.5,
        fontSize: 13.0,
        height: 2.0);
    //通过DefaultTextStyle.merge统一设置文字样式
    return DefaultTextStyle.merge(
        style: descTextStyle,
        child: new Container(
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildThreeWidgets('FREE', '25 min'),
                buildThreeWidgets('COOK', '15 min'),
                buildThreeWidgets('ASDE', '2.7 h'),
              ]),
        ));
  }

  ///含有三个部件的列
  Column buildThreeWidgets(String secondTitle, String thirdTitle) {
    var icon = new Icon(
      Icons.cake,
      color: Colors.blue,
    );
    var secondRow = new Row(
      //主轴（横轴中心对齐）
      mainAxisAlignment: MainAxisAlignment.center,
      children: [new Text(secondTitle)],
    );
    var thirdRow = new Row(
      //主轴（横轴中心对齐）
      mainAxisAlignment: MainAxisAlignment.center,
      children: [new Text(thirdTitle)],
    );
    return new Column(
      //副轴（横轴）中心对齐
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [icon, secondRow, thirdRow],
    );
  }
  //5个五角星下面的一行 end

}

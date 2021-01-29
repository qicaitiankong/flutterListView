import 'package:flutter/material.dart';

/*
GridView
使用GridView将widget放置为二维列表。 GridView提供了两个预制list，
或者您可以构建自定义网格。
当GridView检测到其内容太长而不适合渲染框时，它会自动滚动。
在网格中放置widget
检测列内容超过渲染框时自动提供滚动
构建您自己的自定义grid，或使用一下提供的grid之一:
GridView.count 允许您指定列数
GridView.extent 允许您指定项的最大像素宽度
*/
var screenWidth;

class GridViewTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GridViewTestState();
  }
}

class GridViewTestState extends State {
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return buildGrid();
  }
}

Widget buildGrid() {
  //适用于列数固定
  return GridView.count(
    //每行view 个数
    crossAxisCount: 3,
    padding: const EdgeInsets.all(4),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
    children: _buildGridTileList(30),
    //设置宽高比盛放底部文字
    childAspectRatio: 0.8,
  );
  //适用于gride 限制每个最大宽度
  // return new GridView.extent(
  //   //单个view宽度
  //   maxCrossAxisExtent: (screenWidth) / 3.0,
  //   //grideView 四个边与屏幕的间距
  //   padding: const EdgeInsets.all(4),
  //   //垂直方向间隔
  //   mainAxisSpacing: 4.0,
  //   //水平方向间隔
  //   crossAxisSpacing: 4.0,
  //   children: _buildGridTileList(30),
  // );
}

List<Container> _buildGridTileList(int count) {
  var textStyle = new TextStyle(fontSize: 14.0, color: Colors.green);
  return new List<Container>.generate(
      count,
      (int index) => new Container(
          color: Colors.red,
          child: new Column(
            children: [
              new Container(
                width: screenWidth / 3.0,
                height: screenWidth / 3.0,
                child: new Image.asset(
                  'images/square_reba.png',
                  fit: BoxFit.cover,
                ),
              ),
              new Text('文字介绍123455',
                  style: textStyle, textAlign: TextAlign.center),
            ],
          )));
}

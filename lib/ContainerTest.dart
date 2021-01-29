import 'package:flutter/material.dart';

/*
许多布局会自由使用容器来使用padding分隔widget，
或者添加边框（border）或边距（margin）。
您可以通过将整个布局放入容器并更改其背景颜色或图片来更改设备的背景。
添加padding, margins, borders
改变背景颜色或图片
包含单个子widget，但该子widget可以是Row，Column，甚至是widget树的根
 */
class ContainerTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContainerState();
  }
}

class ContainerState extends State {
  @override
  Widget build(BuildContext context) {
    return new Container(
      //页面背景色
      decoration: new BoxDecoration(color: Colors.red),
      child: new Column(
        children: [
          new Row(
            children: [
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                      border:
                          new Border.all(width: 10.0, color: Colors.black38),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(8.0))),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/reba.png'),
                ),
              ),
              new Expanded(
                child: new Container(
                  decoration: new BoxDecoration(
                      border:
                          new Border.all(width: 10.0, color: Colors.black38),
                      borderRadius:
                          const BorderRadius.all(const Radius.circular(8.0))),
                  margin: const EdgeInsets.all(4.0),
                  child: new Image.asset('images/reba.png'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/*
管理状态
重点是什么?
有多种方法可以管理状态.
选择使用何种管理方法
如果不是很清楚时, 那就在父widget中管理状态吧.
如何决定使用哪种管理方法？以下原则可以帮助您决定：
  如果状态是用户数据，如复选框的选中状态、滑块的位置，则该状态最好由父widget管理
  如果所讨论的状态是有关界面外观效果的，例如动画，那么状态最好由widget本身来管理.
  我们将通过创建三个简单示例来举例说明管理状态的不同方式：TapboxA、TapboxB和TapboxC
  这些示例使用GestureDetector捕获Container上的用户动作。
*/

/*
widget管理自己的状态
_TapboxAState 类:
  1、管理TapboxA的状态.
  2、定义_active：确定盒子的当前颜色的布尔值.
  3、定义_handleTap()函数，该函数在点击该盒子时更新_active,并调用setState()更新UI.
  4、实现widget的所有交互式行为.
*/

import 'package:flutter/material.dart';

class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);
  @override
  _TapboxAState createState() => new _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.green[600],
        ),
      ),
    );
  }
}

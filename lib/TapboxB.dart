/*

父widget管理widget的state

TapboxB通过回调将其状态导出到其父项。
由于TapboxB不管理任何状态，因此它的父类为StatelessWidget。

  ParentWidgetState 类:
    为TapboxB 管理_active状态.
    实现_handleTapboxChanged()，当盒子被点击时调用的方法.
    当状态改变时，调用setState()更新UI.
TapboxB 类:
  继承StatelessWidget类，因为所有状态都由其父widget处理.
  当检测到点击时，它会通知父widget.
*/

import 'package:flutter/material.dart';

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;
  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        width: 300,
        height: 300,
        decoration: new BoxDecoration(
          color: active ? Colors.black : Colors.yellow,
        ),
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32, color: Colors.red),
          ),
        ),
      ),
    );
  }
}

// parent widget
class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() {
    // TODO: implement createState
    return _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxB(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

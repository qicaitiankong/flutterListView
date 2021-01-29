// 混合管理

import 'package:flutter/material.dart';

class ParentWidget2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidget2> {
  bool _active = false;
  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> onChanged;
  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;
  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      onTapUp: _handleTapUp,
      onTapDown: _handleTapDown,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(
            widget.active ? 'active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.red),
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
            color: widget.active ? Colors.lightGreen : Colors.purple,
            border: _highlight
                ? new Border.all(color: Colors.teal[700], width: 7.0)
                : null),
      ),
    );
  }
}

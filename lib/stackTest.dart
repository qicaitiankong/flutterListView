import 'package:flutter/material.dart';

/*
Stack
使用Stack来组织需要重叠的widget。
widget可以完全或部分重叠底部widget。
用于与另一个widget重叠的widget
子列表中的第一个widget是base widget; 
随后的子widget被覆盖在基础widget的顶部
Stack的内容不能滚动
您可以选择剪切超过渲染框的子项
*/
class stackTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return stackState();
  }
}

class stackState extends State {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      //设置重叠控件位置,00为正中间，11为右下角，-1，0为水平左边
      alignment: const Alignment(0, 0.95),
      children: [
        new CircleAvatar(
          backgroundImage: new AssetImage('images/reba.png'),
          radius: 100.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Colors.black45,
          ),
          child: new Text(
            'Mia 8',
            style: new TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        )
      ],
    );
  }
}

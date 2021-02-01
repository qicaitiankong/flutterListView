import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
/*
ListTile是Material Components库中的一个专门的行级widget，
用于创建包含最多3行文本和可选的行前和行尾图标的行。
ListTile在Card或ListView中最常用，但也可以在别处使用。
包含最多3行文本和可选图标的专用行
比起Row不易配置，但更易于使用
Material Components 库里的widget
*/

class ListTileTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListTileState();
  }
}

class ListTileState extends State {
  void dioNetwork() async {
    final dio = Dio();
    final response = await dio.get(
        'http://47.104.255.147:8089/LinPic/userPic/166/2e916952-6029-43bb-b868-a47803417dee.o6zAJszNwPS00IesFkn79wg-n95k.YuOuivovKZ9p021925d37b7b1aa13827dd47e49c8754.png');
    if (response.statusCode == HttpStatus.ok) {
      print('请求成功${response.data}');
    } else {
      print('请求错误');
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildCard();
  }

  Widget buildCard() {
    return new Container(
      child: new Card(
        shadowColor: Colors.black26,
        margin: EdgeInsets.all(4.0),
        child: new Column(
          children: [
            new ListTile(
              onTap: dioNetwork,
              leading: new Image.asset('images/reba.png'),
              title: new Text('1625 hdjsdhdjsdjhf'),
              subtitle: new Text('400-jd34544566'),
            ),
            //分割线
            new Divider(),
            new ListTile(
              leading: new Image.asset('images/reba.png'),
              title: new Text('1625 hdjsdhdjsdjh'),
              subtitle: new Text('400-jd34544566'),
            ),
            new Divider(),
            new ListTile(
              leading: new Image.asset('images/reba.png'),
              title: new Text('1625 hdjsdhdjsd'),
              subtitle: new Text('400-jd34544566'),
            ),
          ],
        ),
      ),
    );
  }
}
